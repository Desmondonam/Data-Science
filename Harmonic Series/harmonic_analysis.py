
import csv
from HarmonicSeriesRow import HarmonicSeriesRow
import HarmonicSeriesTest

'''
HarmonicSeries class : Represents the harmonic series and is initialized with a base frequency.
'''


class HarmonicSeries(object):
    def __init__(self, base_fq):
        self.base_freq = base_fq
        # The maximum interval our harmonic series contains
        numintervals = 32
        # An array that contains properties for each interval in the harmonic series
        self.series_rows = [None] * numintervals
        self.generate_rows()

    # generate_rows(): adds information for each interval in the harmonic series to the series_rows array
    def generate_rows(self):
        for i in range(0, len(self.series_rows)):
            self.series_rows[i] = self.generate_row(i + 1)

    # generate_row(): returns the HarmonicSeriesRow object that contains properties about a
    # specific interval in the harmonic series
    def generate_row(self, interval):
        row = HarmonicSeriesRow(interval, self.base_freq)
        return row

    # get_frequency(interval) : Accepts a harmonic interval as a parameter and returns the corresponding frequency,
    # using the frequency property of the HarmonicSeriesRow class
    def get_frequency(self, interval):
        return self.series_rows[interval - 1].frequency

    # get_ratio(interval) : Accepts a harmonic interval as a parameter and returns the ratio of
    # the interval to its lowest octave, using the ratio property of the HarmonicSeriesRow class
    def get_ratio(self, interval):
        return self.series_rows[interval - 1].ratio

    # show_all_rows(): Prints each row in the harmonic series
    def show_series_rows(self):
        print("[Harmonic Interval, Frequency Ratio to Fundamental, Frequency, Octave,"
              " Denom, Ratio, Reduced Ratio, Decimal,Frequency in Lowest Octave]")
        for i in range(0, len(self.series_rows)):
            self.series_rows[i].show_row()

    # show(): prints all the cells in csv file that has a base frequency of 528 hertz
    def show_csv_rows(self):
        # Manually change file name here
        my_file = open('harmonic_series.csv', 'rU')
        my_file.seek(0)
        csv_list = list(csv.reader(my_file))
        header_cnt = 0
        for row in csv_list:
            if not row[0] == '1':
                header_cnt += 1
            elif row[0] == '1':
                #base_fq = float(row[8])
                #print("The base fq is ", base_fq)
                break
        csv_list = csv_list[header_cnt:]
        for row in csv_list:
            print(row)


# main() : Creates a HarmonicSeries object given a base frequency, prints out each calculated row in the harmonic series,
# and compares this calculated data with the csv data using functions inHarmonicSeriesTest

#You can also run the other methods get_frequency(interval) and get_ratio(interval) on the harmonic_series object
def main():
    # Change base_frequency manually
    base_frequency = 528
    print("Your base frequency is %d hertz" % base_frequency)
    harmonic_series = HarmonicSeries(base_frequency)
    harmonic_series.show_series_rows()
    HarmonicSeriesTest.test_all_cells(harmonic_series)
    # HarmonicSeriesTest.test_frequency(harmonic_series)
    # print(harmonic_series.get_ratio(9))
    # print(harmonic_series.get_frequency(3))
    # harmonic_series.show_csv_rows()

if __name__ == '__main__':
    main()
