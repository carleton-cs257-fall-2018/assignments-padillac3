def main():
    if sys.argv.length > 4:
        errorMessage()
        return []
    if sys.argv[2] != "books" or sys.argv[2] != "authors":
        errorMessage()
        return []

    readFile()

    produceOutput()



def produceOutput():
    #This function will return a list of all desired output
    if sys.argv[2] == "books":
        titles = []
        for book in library:
            titles.append(book.getTitle())

        if sys.argv[2] == "reverse":
            sortedTitles = titles.sort(reverse = True)
        else:
            sortedTitles = titles.sort()

        return sortedTitles

    if sys.argv[2] == "authors":
        authorNames = []
        for book in library:
            authorNames.append((book.getFirstName() + " " + book.getLastName()))

        if sys.argv[2] == "reverse":
            sortedNames = authorNames.sort(key=lambda name : name.split()[1][0], reverse = True)
        else:
            sortedNames = authorNames.sort(key=lambda name : name.split()[1][0])
            
        return sortedNames


def errorMessage():
    sys.stderr.write("Usage: python3 books1.py input-file action [sort-direction]")
