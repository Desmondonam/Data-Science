library(data.table)
library(DBI)
library(RPostgres)
library(dplyr)

convert_array <- function(x){
  x <- gsub("(^\\{\"|\\\"}$)", "", x)
  x <- gsub("(^\\{|\\}$)", "", x)
  x <- gsub('\",\"', ",", x)
  x <- gsub(',\"', ",", x)
  x <- gsub('\",', ",", x)
  unlist(strsplit(x, split = ","))
}

message("Reading data")
gwas_catalog <- fread("/mnt/d/testdata",
                      data.table = F,
                      sep = "\t",
                      header = T,
                      fill = T,
                      quote = "") %>% 
  dplyr::filter(!is.na(PUBMEDID)) %>%
  cbind(ingest_date = Sys.Date(),.)

message("Munging data")
gwas_catalog_nachr <- gwas_catalog %>% dplyr::filter(CHR_ID == "")
gwas_catalog_not_nachr <- gwas_catalog %>% dplyr::filter(CHR_ID != "")

oldw <- getOption("warn")
options(warn = -1)
gwas_catalog_chrPosFixed <- gwas_catalog_not_nachr %>%
  dplyr::mutate(CHR_ID = ifelse(CHR_ID == "X", 23,
                                ifelse(CHR_ID == "Y", 24, CHR_ID)
  )) %>%
  dplyr::mutate(
    CHR_ID = as.integer(CHR_ID),
    CHR_POS = as.integer(CHR_POS)
  )
colnames(gwas_catalog_chrPosFixed) <- gsub(" ","_",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub("-","_",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub("(","",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub(")","",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub("[","",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub("]","",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub("/","_",colnames(gwas_catalog_chrPosFixed),fixed = T)
colnames(gwas_catalog_chrPosFixed) <- gsub("95%","NINETYFIFTHpercent",colnames(gwas_catalog_chrPosFixed),fixed = T)
options(warn = oldw)
gwas_catalog_chrPosFixed <- gwas_catalog_chrPosFixed %>%
  dplyr::mutate(ingest_date = as.character(ingest_date),
                DATE_ADDED_TO_CATALOG = as.Date(DATE_ADDED_TO_CATALOG),
                DATE = as.Date(DATE),
                DATE_ADDED_TO_CATALOG = as.character(DATE_ADDED_TO_CATALOG),
                DATE = as.character(DATE),
                INTERGENIC = ifelse(is.na(INTERGENIC),0,1),
                across(where(is.character),~ gsub("\"","",
                                                  gsub("\'","",
                                                       gsub("3'","3prime",
                                                            gsub("5'","5prime",.x,fixed = T),
                                                            fixed = T),
                                                       fixed = T),
                                                  fixed = T)),
                across(where(is.character),~ gsub('"',"",.x,fixed = T)),
                MAPPED_TRAIT_URI = strsplit(MAPPED_TRAIT_URI, split = ", ", fixed = T)) %>%
  dplyr::mutate(
    MAPPED_TRAIT_TERM = sapply(MAPPED_TRAIT_URI, function(i) {
      gsub("^.+[/]", "", i) %>% paste0(collapse = ", ")
    }),
    MAPPED_TRAIT_PATH = sapply(MAPPED_TRAIT_URI, function(i) {
      gsub("(.*)/.*", "\\1", i) %>% paste0(.,"/",collapse = ", ")
    }),
    MAPPED_TRAIT_URI = sapply(MAPPED_TRAIT_URI, function(i) {
      paste0(i, collapse = ", ")
    })
  ) %>%
  dplyr::filter(!SNPS %like% "x") %>%
  mutate(across(where(is.numeric),as.character)) %>%
  mutate(MAPPED_TRAIT = gsub(", "," | ",MAPPED_TRAIT,fixed = T),
         MAPPED_TRAIT = gsub(",","_",MAPPED_TRAIT,fixed = T),
         MAPPED_TRAIT = gsub(" | ",", ",MAPPED_TRAIT,fixed = T),
         MAPPED_TRAIT_TERM = gsub("_", ":", MAPPED_TRAIT_TERM, fixed = T))

gwas_catalog_chrPosFixed <- gwas_catalog_chrPosFixed[,c(1:37,40,41,38,39)]