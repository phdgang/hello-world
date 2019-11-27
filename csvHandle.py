import csv


class CSV(object):

    def __init__(self, readingFile):
        self.readingFile = readingFile


    def csvHandle(self):
        listDict = []
        with open(self.readingFile) as csvfile:
            csv_reader = csv.DictReader(csvfile)
            print csv_reader
            for row in csv_reader:
                listDict.append(row)
        return listDict





if __name__ == '__main__':

    reading_file = 'data.csv'
    csvH = CSV()
    list = csvH.csvHandle(reading_file)
    print list


