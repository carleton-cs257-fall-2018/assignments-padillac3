import csv
import sys
	
class Book:
	def __init__(self, title, year, firstName, lastName, lifeTime):
		self.title = title
		self.year = year
		self.firstName = firstName
		self.lastName = lastName
		self.lifeTime = lifeTime

	def getTitle(self):
		return self.title

	def getYear(self):
		return self.year

	def getFirstName(self):
		return self.firstName

	def getLastName(self):
		return self.lastName

	def getLifeTime(self):
		return self.lifeTime

# Takes in the name of the csv you want to read, returns a list of Book objects created from information in the csv
def parseCSV(csvName):
	#csvName = sys.argv[1]
	# add try catch here
	try:
        with open(csvName) as csvFile:
            reader = csv.reader(csvFile)
    except IOError: 
        sys.stderr.write("Error: file not found.") 
        exit()
        
    library = []
    for row in reader:
    authorLine = row[2]
        splitAuthor = authorLine.split(" ")
        firstName = splitAuthor[0]
			
        # Cases for one author with only one last name
        if len(splitAuthor) == 3:
            lastName = splitAuthor[1]
            lifeTime = splitAuthor[2]
        else:
            # Case for one author with two last names
            if len(splitAuthor) == 4:
                lastName = splitAuthor[1] + splitAuthor[2]
				lifeTime = splitAuthor[3]
            # Case for multiple authors
            else:
				lastName = "idk"
				lifeTime = "idk"
			
           
					
			
        book = Book(row[0], row[1], firstName, lastName, lifeTime)
        library.append(book)
	return library


def test():
    csvName = sys.argv[1]
	library = parseCSV(csvName)
	for book in library:
		print(book.getFirstName())
		print(book.getFirstName() + book.getLastName() +  book.getTitle())

test()
