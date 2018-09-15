import csv
import sys

fileName = 'books.csv'

try: 
	file = open(fileName)
except e:
	print(sys.stderr, 'Cannot open', fileName)
	exit()
