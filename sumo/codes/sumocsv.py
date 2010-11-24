#!/opt/local/bin/python
# -*- coding: utf-8 -*-
import csv

#CSV reader that is able to handle utf-8 and unicode
def unicode_csv_reader(utf8_data, dialect=csv.excel, **kwargs):
    csv_reader = csv.reader(utf8_data, dialect=dialect, **kwargs)
    for row in csv_reader:
        yield [unicode(cell, 'utf-8') for cell in row]

def main():
    #prepare output csv file
    f = open('out.csv', 'w')
    writer = csv.writer(f)
    #a bunch of constants of this script
    from sumoconst import YEAR, MONTH
    #make the variations of sumo stats data
    variations = [(x, y, x+y) for x in YEAR for y in MONTH]
    #combine a piece of csv files to single output csv file
    for x, y, n in variations[:-1]:
        #filename = 'csv/'+n+'.csv'
        filename = n+'.csv'
        #print filename
        reader = unicode_csv_reader(open(filename))
        reader.next()
        for vs, rikishi, win in reader:
            #add date info and change the order of columns
            row = [ v for v in [rikishi, vs, win, x, y] ]
            writer.writerow(row)
        #print rikishi, vs, win
    del writer
    f.close()

if __name__ == "__main__":
    main()
