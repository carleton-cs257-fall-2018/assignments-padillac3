import csv
import sys

csvName = sys.argv[1]

with open(csvName) as csvfile:
	reader = csv.reader(csvfile)
	
class Book:
	def __init__(self, title, year, firstName, lastName, lifeTime):
		self.title = title
		self.year = year
		self.firstName = firstName
		self.lastName = lastName
		self.lifeTime = lifeTime

	def getTitle():
		return self.title

	def getYear():
		return self.year

	def getFirstName():
		return self.firstName

	def getLastName():
		return self.lastName

	def getLifeTime():
		return self.lifeTime

