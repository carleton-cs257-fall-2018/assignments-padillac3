# Books Data Source Test
# by Chris Padilla and Yasmeen Awad

import sys
import booksdatasource
import unittest


class BooksDataSourceTest(unittest.TestCase):

    def setUp(self):
        self.data_source = booksdatasource.BooksDataSource("books.csv", "authors.csv", "books_authors.csv")
        
    def tearDown(self):
        pass

    # Book functions
    
    def test_book_valid_id(self):
        self.assertEqual(self.data_source.book(20), {'id': 20, 'title': "Sense and Sensibility", 'publication_year': 1813})
    
    def test_book_negative_id(self):
        self.assertRaises(Exception, self.data_source.book(-10))
        
    def test_book_high_id(self):
        pass
    
    def test_book_type_error(self):
        pass
    
    def test_books_positional_arg(self):
        # If someone types in a positional rather than keyword arg
        pass
    
    def test_books_search_key_valid_no_results(self):
        pass
    
    def test_books_search_key_type_error(self):
        pass
    
    def test_books_start_year_valid_no_results(self):
        pass
    
    def test_books_start_year_type_error(self):
        pass
    
    def test_books_end_year_valid_no_results(self):
        pass
    
    def test_books_end_year_type_error(self):
        pass
    
    def test_books_sort_by_invalid_string(self):
        pass
    
    def test_books_sort_by_type_error(self):
        pass
    
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
        self.assertEqual(self.data_source.books(author_id=23, start_year=1855), {'id': 44, 'title': "Great Expectations", 'publication_year': 1860})
        
    def test_books_start_year_and_author_id_reversed(self):
        self.assertEqual(self.data_source.books(start_year=1855, author_id=23), {'id': 44, 'title': "Great Expectations", 'publication_year': 1860})
    
    def test_books_search_text_and_start_year(self):
        self.assertEqual(self.data_source.books(search_text="time", start_year=1990), {'id': 26, 'title': "Thief of Time", 'publication_year': 1996})
    
    def test_books_author_id_and_sort_by(self):
        pass
    
    def test_books_start_year_and_end_year(self):
        pass
    
    # Authors functions
    
    def test_author_valid_id(self):
        pass
    
    def test_author_negative_id(self):
        pass
    
    def test_author_high_id(self):
        pass
    
    def test_author_type_error(self):
        pass
    
    def test_authors_positional_arg(self):
        # If someone types in a positional rather than keyword arg
        pass
    
    def test_authors_search_key_valid_no_results(self):
        pass
    
    def test_authors_search_key_type_error(self):
        pass
    
    def test_authors_start_year_valid_no_results(self):
        pass
    
    def test_authors_start_year_type_error(self):
        pass
    
    def test_authors_end_year_valid_no_results(self):
        pass
    
    def test_authors_end_year_type_error(self):
        pass
    
    def test_authors_sort_by_invalid_string(self):
        pass
    
    def test_authors_sort_by_type_error(self):
        pass
    
    # Valid input
    
    def test_authors_valid_book_id(self):
        pass
    
    def test_authors_valid_search_text(self):
        pass
    
    def test_authors_valid_start_year(self):
        pass
    
    def test_authors_valid_end_year(self):
        pass
    
    def test_authors_valid_sort_by(self):
        pass
    
    def test_authors_book_id_and_search_text(self):
        pass
    
    def test_authors_book_id_and_start_year(self):
        pass
    
    def test_authors_search_text_and_start_year(self):
        pass
    
    def test_authors_book_id_and_sort_by(self):
        pass
    
    def test_authors_start_year_and_end_year(self):
        pass
    
    # Books for author / Authors for book functions
    
    def test_books_for_author_keyword_arg(self):
        pass
    
    def test_authors_for_book_keyword_arg(self):
        pass
    
    def test_books_for_author_valid(self):
        pass
    
    def test_authors_for_book_valid(self):
        pass
    
    
    

    
if __name__ == '__main__':
	unittest.main()
		
