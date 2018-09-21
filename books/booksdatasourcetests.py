# Books Data Source Test
# by Chris Padilla and Yasmeen Awad

import sys
import booksdatasource
import unittest
#These modules allows for more dynamic sorting by keys, and allows multiple levels of sorting.
from operator import itemgetter, attrgetter

##### Tests appear to run wildly out of order? does this mean that the '.' telling us which tests passed is meaningless?

class BooksDataSourceTest(unittest.TestCase):

    def setUp(self):
        self.data_source = booksdatasource.BooksDataSource("books.csv", "authors.csv", "books_authors.csv")

    def tearDown(self):
        pass

    # testing data_source.book function

    def test_book_valid_id(self):
        self.assertEqual(self.data_source.book(20), {'id': 20, 'title': "Sense and Sensibility", 'publication_year': 1813})

    def test_book_negative_id(self):
        self.assertRaises(ValueError, self.data_source.book, -10)

    def test_book_high_id(self):
        self.assertRaises(ValueError, self.data_source.book, 99999)

    def test_book_type_error(self):
        self.assertRaises(ValueError, self.data_source.book, "hey")

    # testing data_source.books function

    def test_books_search_key_valid_no_results(self):
        self.assertEqual(self.data_source.books(search_text="grandma"), [])

    def test_books_start_year_valid_no_results(self):
        self.assertEqual(self.data_source.books(start_year=2018), [])

    def test_books_end_year_valid_no_results(self):
        self.assertEqual(self.data_source.books(end_year=1700), [])

    # Valid input

    def test_books_valid_author_id(self):
        # Author with multiple books
        self.assertEqual(self.data_source.books(author_id=13), [{'id': 13, 'title': "Moby Dick", 'publication_year': 1851}, {'id': 16, 'title': "Omoo", 'publication_year': 1847}])

    def test_books_valid_search_text(self):
        self.assertEqual(self.data_source.books(search_text="time"), [{'id': 9, 'title': "Love in the Time of Cholera", 'publication_year': 1985}, {'id': 26, 'title': "Thief of Time", 'publication_year': 1996}])

    def test_books_valid_start_year(self):
        self.assertEqual(self.data_source.books(start_year=2014), [{'id': 37, 'title': "The Fifth Season", 'publication_year': 2015}, {'id': 38, 'title': "The Obelisk Gate", 'publication_year': 2015}, {'id': 35, 'title': "The Power", 'publication_year': 2016}, {'id': 39, 'title': "The Stone Sky", 'publication_year': 2015}])

    def test_books_valid_end_year(self):
        self.assertEqual(self.data_source.books(end_year=1814), [{'id': 18, 'title': "Pride and Prejudice", 'publication_year': 1813}, {'id': 20, 'title': "Sense and Sensibility", 'publication_year': 1813}])

    def test_books_valid_sort_by_year(self):
        self.assertEqual(self.data_source.books(sort_by='year'), self.data_source.books().sort(key=lambda book : book['publication_year']))

    def test_books_valid_sort_by_title(self):
        self.assertEqual(self.data_source.books(), self.data_source.books().sort(key=lambda book : book['title']))

    def test_books_author_id_and_search_text(self):
        self.assertEqual(self.data_source.books(author_id=4, search_text="and"), [{'id': 18, 'title': "Pride and Prejudice", 'publication_year': 1813}, {'id': 20, 'title': "Sense and Sensibility", 'publication_year': 1813}])

    def test_books_author_id_and_start_year(self):
        self.assertEqual(self.data_source.books(author_id=23, start_year=1855), [{'id': 44, 'title': "Great Expectations", 'publication_year': 1860}])

    def test_books_start_year_and_author_id_reversed(self):
        self.assertEqual(self.data_source.books(start_year=1855, author_id=23), [{'id': 44, 'title': "Great Expectations", 'publication_year': 1860}])

    def test_books_search_text_and_start_year(self):
        self.assertEqual(self.data_source.books(search_text="time", start_year=1990), [{'id': 26, 'title': "Thief of Time", 'publication_year': 1996}])

    def test_books_author_id_and_sort_by(self):
        self.assertEqual(self.data_source.books(author_id=23, sort_by="year"), [{"id": 43, "title": "Bleak House", "publication_year": 1852}, {"id": 44, "title": "Great Expectations", "publication_year": 1860}])

    def test_books_start_year_and_end_year(self):
        self.assertEqual(self.data_source.books(start_year=1861 , end_year=1861), [{'id':42, 'title': "Silas Marner", "publication_year":1861}])

    # testing data_source.author function

    def test_author_valid_id(self):
        self.assertEqual(self.data_source.author(4), {'id': 4, 'last_name': 'Austen', 'first_name': 'Jane', 'birth_year': 1775, 'death_year': 1817})

    def test_author_negative_id(self):
        self.assertRaises(ValueError, self.data_source.author, -5)

    def test_author_high_id(self):
        self.assertRaises(ValueError, self.data_source.author, 99999)

    def test_author_type_error(self):
        self.assertRaises(ValueError, self.data_source.author, "Swag")

    # testing data_source.authors function

    def test_authors_search_key_valid_no_results(self):
        self.assertEqual(self.data_source.authors(search_text="Lady Gaga"), [])

    def test_authors_start_year_valid_no_results(self):
        self.assertEqual(self.data_source.authors(start_year=2300), [])
        #How do we handle authors with unknown death dates? Maybe restrict user from entering future year?

    def test_authors_end_year_valid_no_results(self):
        self.assertEqual(self.data_source.authors(end_year=1700), [])

    # Valid input

    def test_authors_valid_book_id(self):
        self.assertEqual(self.data_source.authors(book_id=18), [{'id': 4, 'last_name': 'Austen', 'first_name': 'Jane', 'birth_year': 1775, 'death_year': 1817}])

    def test_authors_valid_search_text(self):
        self.assertEqual(self.data_source.authors(search_text="lois"), [{'id': 12, 'last_name': "Bujold", 'first_name': "Lois McMaster", 'birth_year': 1949, 'death_year': None}])

    def test_authors_valid_start_year(self):
        self.assertEqual(len(self.data_source.authors(start_year=2018)), 10)
        #Checks to make sure the list is 10 authors long

    def test_authors_valid_end_year(self):
        self.assertEqual(len(self.data_source.authors(start_year=1820)), 7)
        #Checks to make sure the list is 7 authors long

    def test_authors_valid_sort_by(self):
        self.assertEqual(self.data_source.authors(sort_by='birth_year'), self.data_source.authors(sort_by="birth_year").sort(key=attrgetter('birth_year', 'last_name', 'first_name')))

    def test_authors_book_id_and_search_text(self):
        self.assertEqual(self.data_source.authors(book_id=6, search_text="Neil"), [{'id': 5, 'last_name': "Gaiman", 'first_name': "Neil", 'birth_year': 1960, 'death_year': None}])

    def test_authors_book_id_and_start_year(self):
        self.assertEqual(self.data_source.authors(book_id=6, start_year=2016), [{'id': 5, 'last_name': "Gaiman", 'first_name': "Neil", 'birth_year': 1960, 'death_year': None}])

    def test_authors_search_text_and_start_year(self):
        self.assertEqual(self.data_source.authors(search_text="ot", start_year=1860), [{'id': 22, "last_name": "Eliot", 'first_name':"George", 'birth_year': 1819, 'death_year': 1880}])

    def test_authors_book_id_and_sort_by(self):
        self.assertEqual(self.data_source.authors(book_id=6, sort_by='birth_year'), [{'id': 6, 'last_name': "Pratchett", 'first_name': "Terry", 'birth_year': 1948, 'death_year': 2015}, {'id': 5, 'last_name': "Gaiman", 'first_name': "Neil", 'birth_year': 1960, 'death_year': None}])

    def test_authors_start_year_and_end_year(self):
        self.assertEqual(len(self.data_source.authors(start_year=1818 , end_year=2018)), 24)
        #Checks to make sure the function returns 24 authors, all except Jane Austen


    # Testing books_for_author / authors_for_book functions

    def test_books_for_author_valid(self):
        self.assertEqual(self.data_source.books_for_author(3), [{'id': 4, "title": "Elmer Gantry", 'publication_year': 1927}])

    def test_authors_for_book_valid(self):
        self.assertEqual(self.data_source.authors_for_book(13), [{'id': 13, 'last_name': 'Melville', 'first_name': "Herman", 'birth_year': 1819, 'death_year': 1891}])





if __name__ == '__main__':
	unittest.main()
