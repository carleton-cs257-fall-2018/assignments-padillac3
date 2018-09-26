#Books Phase 1
#Chris Padilla and Yasmeen Awad
#

import csv
import sys

# This class is for Book objects. Parameters title and year should be strings indicating the title of the book
# and the year it was published. Authors should be a list of lists containing information about the people who
# wrote the book, formatted like so: [[first_name1, last_name1, life_span1], [first_name2, last_name2...]...]
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

    # Open csv file
    try:
        csvFile = open(csvName)
        reader = csv.reader(csvFile)
    except IOError:
        sys.stderr.write("Error: file not found.")
        exit()

    # Iterate through rows in csv
    library = []
    for row in reader:
        authorLine = row[2]
        authorStrings = authorLine.split(" and ")

        # Iterate through list of authors
        authorObjects = []
        for author in authorStrings:
            splitAuthor = author.split(" ")
            firstName = splitAuthor[0]

            # Cases for author with only one last name
            if len(splitAuthor) == 3:
                lastName = splitAuthor[1]
                lifeTime = splitAuthor[2]

            # Case for author with two last names
            elif len(splitAuthor) == 4:
                lastName = splitAuthor[1] + " " + splitAuthor[2]
                lifeTime = splitAuthor[3]
            authorObjects.append([firstName, lastName, lifeTime])

        library.append(Book(row[0], row[1], authorObjects))

    return library

# This function takes in a list of Book objects and returns a list of sorted strings corresponding to the desired output
# specified in the command line arguments
def produceOutput(library):

    # Titles
    if sys.argv[2] == "books":
        titles = []
        for book in library:
            titles.append(book.getTitle())

        if len(sys.argv) == 4:
            if sys.argv[3] == "reverse":
                titles.sort(reverse = True)
            elif sys.argv[3] == "forward":
                titles.sort()
            else:
                errorMessage()
        else:
            titles.sort()

        return titles

    # Author names
    if sys.argv[2] == "authors":
        authorNames = []
        for book in library:
            bookAuthors = book.getAuthors()
            for i in bookAuthors:
                authorNames.append(i[0] + " " + i[1])

        if len(sys.argv) == 4:
            if sys.argv[3] == "reverse":
                authorNames.sort(key=lambda name : name.split()[-1], reverse = True)
            elif sys.argv[3] == "forward":
                authorNames.sort(key=lambda name : name.split()[-1])
            else:
                errorMessage()
        else:
            authorNames.sort(key=lambda name : name.split()[-1])

        return authorNames

# Throws an error for bad command line input
def errorMessage():
    sys.stderr.write("Usage: python3 books1.py input-file action [sort-direction]")
    exit()

# Main function accounts for command line input and prints output based on command line arguments
def main():
    # Handling bad input
    if len(sys.argv) > 4 or len(sys.argv) < 3:
        errorMessage()
    if sys.argv[2] != "books" and sys.argv[2] != "authors":
        errorMessage()

    # Get data from csv and print
    library = parseCSV(sys.argv[1])
    output = produceOutput(library)
    for i in output:
        print(i)


if __name__ == "__main__":
    main()
