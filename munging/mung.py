import pandas as pd 
import seaborn as sns
import matplotlib.pyplot as plt
import matplotlib
matplotlib.style.use('ggplot')
%matplotlib inline

# get the data that we are to wrangle

outlays = pd.read_csv('path to the data/ link in the postgres')
outlays.head() 

outlays = pd.read_csv(
    'data/outlays.csv',
    thousands=',',
    dtype={'Agency Code': str,
           'Bureau Code': str,
           'Account Code': str,
           'Treasury Agency Code': str,
           'Subfunction Code': str}
    )
print(outlays['Agency Code'].head())
outlays['1973'].describe()

# string clean-up
print(pd.unique(outlays.account_name.ravel()))
outlays.account_name = outlays.account_name.str.strip().str.lower()
print(pd.unique(outlays.account_name.ravel()))

# oops capitalize DOD again
outlays.account_name = outlays.account_name.str.replace(' dod ', ' DOD ') # regex works too
print(pd.unique(outlays.account_name.ravel()))

outlays.subfunction_title = outlays.account_name.str.strip().str.lower()
outlays.bea_category = outlays.bea_category.str.lower()

##tidy the data
variables = ['agency_code', 'agency_name', 'bureau_code', 'bureau_name', 'account_code', 'account_name', 'treasury_agency_code', 'subfunction_code', 'subfunction_name', 'bea_category', 'grant_split', 'on_off_budget'] 
outlays = pd.melt(outlays,
               id_vars=variables,
               # name of the new, unpivoted identifier column
               var_name='fiscal_year',
               # name of the value column for the unpivoted data
               value_name='amount'
              )

outlays.head()