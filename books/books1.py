#Books Part 1
#Chris Padilla and Yasmeen Awad
#

import csv
import sys

class Book:
    def __init__(self, title, year, authors):
        self.title = title
        self.year = year
        self.authors = authors

    def getTitle(self):
        return self.title

    def getYear(self):
        return self.year

    def getAuthors(self):
        return self.authors

# Takes in the name of the csv you want to read, returns a list of Book objects created from information in the csv
def parseCSV(csvName):
    #csvName = sys.argv[1]
    # add try catch here
    try:
        csvFile = open(csvName)
        reader = csv.reader(csvFile)
    except IOError:
        sys.stderr.write("Error: file not found.")
        exit()

    library = []
    next(reader)
    for row in reader:
        authorLine = row[2]
        authorStrings = authorLine.split(" and ")

        authorObjects = []
        for author in authorStrings:
            splitAuthor = author.split(" ")
            firstName = splitAuthor[0]

            # Cases for one author with only one last name
            if len(splitAuthor) == 3:
                lastName = splitAuthor[1]
                lifeTime = splitAuthor[2]
            else:
                # Case for one author with two last names
                if len(splitAuthor) == 4:
                    lastName = splitAuthor[1] + " " + splitAuthor[2]
                    lifeTime = splitAuthor[3]
            authorObjects.append([firstName, lastName, lifeTime])

        book = Book(row[0], row[1], authorObjects)
        library.append(book)
    return library


def produceOutput(library):
    #This function will return a list of all desired output

    #return list of book titles
    if sys.argv[2] == "books":
        titles = []
        for book in library:
            titles.append(book.getTitle())

        if len(sys.argv) == 4:
            if sys.argv[3] == "reverse":
                titles.sort(reverse = True)
        else:
            titles.sort()

        return titles

    #return list of author names
    if sys.argv[2] == "authors":
        authorNames = []

        for book in library:
            bookAuthors = book.getAuthors()
            for i in bookAuthors:
                authorNames.append(i[0] + " " + i[1])

        if len(sys.argv) == 4:
            if sys.argv[3] == "reverse":
                authorNames.sort(key=lambda name : name.split()[-1], reverse = True)
        else:
            authorNames.sort(key=lambda name : name.split()[-1])

        return authorNames

def errorMessage():
    sys.stderr.write("Usage: python3 books1.py input-file action [sort-direction]")

def main():
    if len(sys.argv) > 4 or len(sys.argv) < 3:
        errorMessage()
        return
    if sys.argv[2] != "books" and sys.argv[2] != "authors":
        errorMessage()
        return

    library = parseCSV(sys.argv[1])

    output = produceOutput(library)

    for i in output:
        print(i)





if __name__ == "__main__":
    main()
