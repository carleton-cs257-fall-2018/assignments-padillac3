#!/usr/bin/env python3

#Yasmeen Awad and Chris Padilla
# September 25, 2018
'''
    booksdatasource.py
    Jeff Ondich, 18 September 2018

    For use in some assignments at the beginning of Carleton's
    CS 257 Software Design class, Fall 2018.
'''

import csv
import sys
import datetime
from operator import itemgetter

class BooksDataSource:
    '''
    A BooksDataSource object provides access to data about books and authors.
    The particular form in which the books and authors are stored will
    depend on the context (i.e. on the particular assignment you're
    working on at the time).

    Most of this class's methods return Python lists, dictionaries, or
    strings representing books, authors, and related information.

    An author is represented as a dictionary with the keys
    'id', 'last_name', 'first_name', 'birth_year', and 'death_year'.
    For example, Jane Austen would be represented like this
    (assuming her database-internal ID number is 72):

        {'id': 72, 'last_name': 'Austen', 'first_name': 'Jane',
         'birth_year': 1775, 'death_year': 1817}

    For a living author, the death_year is represented in the author's
    Python dictionary as None.

        {'id': 77, 'last_name': 'Murakami', 'first_name': 'Haruki',
         'birth_year': 1949, 'death_year': None}

    Note that this is a simple-minded representation of a person in
    several ways. For example, how do you represent the birth year
    of Sophocles? What is the last name of Gabriel García Márquez?
    Should we refer to the author of "Tom Sawyer" as Samuel Clemens or
    Mark Twain? Are Voltaire and Molière first names or last names? etc.

    A book is represented as a dictionary with the keys 'id', 'title',
    and 'publication_year'. For example, "Pride and Prejudice"
    (assuming an ID of 132) would look like this:

        {'id': 193, 'title': 'A Wild Sheep Chase', 'publication_year': 1982}

    '''

    def __init__(self, books_filename, authors_filename, books_authors_link_filename):
        ''' Initializes this data source from the three specified  CSV files, whose
            CSV fields are:

                books: ID,title,publication-year
                  e.g. 6,Good Omens,1990
                       41,Middlemarch,1871


                authors: ID,last-name,first-name,birth-year,death-year
                  e.g. 5,Gaiman,Neil,1960,NULL
                       6,Pratchett,Terry,1948,2015
                       22,Eliot,George,1819,1880

                link between books and authors: book_id,author_id
                  e.g. 41,22
                       6,5
                       6,6

                  [that is, book 41 was written by author 22, while book 6
                    was written by both author 5 and author 6]

            Note that NULL is used to represent a non-existent (or rather, future and
            unknown) year in the cases of living authors.

            NOTE TO STUDENTS: I have not specified how you will store the books/authors
            data in a BooksDataSource object. That will be up to you, in Phase 3.
        '''
        self.books_filename = books_filename
        self.authors_filename = authors_filename
        self.books_authors_link_filename = books_authors_link_filename

        self.books_raw_data = self._load_books(self.books_filename)
        self.authors_raw_data = self._load_authors(self.authors_filename)
        self.links_raw_data = self._load_links(self.books_authors_link_filename)


    def _create_csv_reader(self, filename):
        try:
            csvFile = open(filename, encoding="utf-8")
            file_reader = csv.reader(csvFile)
            return file_reader, csvFile
        except IOError:
            sys.stderr.write("Error: file not found.")
            exit()


    def _load_books(self, filename):
        file_reader, csvFile = self._create_csv_reader(filename)
        dictionary = {}
        for row in file_reader:
            book_id = int(row[0])
            title = row[1]
            publication_year = int(row[2])
            dictionary[book_id] = {"id": book_id, "title": title, "publication_year": publication_year}

        csvFile.close()
        return dictionary


    def _load_authors(self, filename):
        file_reader, csvFile = self._create_csv_reader(filename)
        dictionary = {}
        for row in file_reader:
            author_id = int(row[0])
            last_name = row[1]
            first_name = row[2]
            birth_year = int(row[3])
            if row[4] == "NULL":
                death_year = None
            else:
                death_year = int(row[4])
            dictionary[author_id] = {"id": author_id, "last_name": last_name, "first_name" : first_name, "birth_year": birth_year, "death_year": death_year}

        csvFile.close()
        return dictionary


    def _load_links(self, filename):
        file_reader, csvFile = self._create_csv_reader(filename)
        link_list = []
        for row in file_reader:
            book_id = int(row[0])
            author_id = int(row[1])
            link_list.append((book_id, author_id))

        csvFile.close()
        return link_list


    def _get_author_ids_by_book(self, book_id):
        author_id_list = []
        for link in self.links_raw_data:
            if link[0] == book_id:
                author_id_list.append(link[1])
        return author_id_list


    def _get_book_ids_by_author(self, author_id):
        book_id_list = []
        for link in self.links_raw_data:
            if int(link[1]) == author_id:
                book_id_list.append(link[0])
        return book_id_list


    def book(self, book_id):
        ''' Returns the book with the specified ID. (See the BooksDataSource comment
            for a description of how a book is represented.)

            Raises ValueError if book_id is not a valid book ID.
        '''
        if type(book_id) != int or book_id < 0 or book_id > len(self.books_raw_data):
            raise ValueError
        else:
            return self.books_raw_data[book_id]


    def books(self, *, author_id=None, search_text=None, start_year=None, end_year=None, sort_by='title'):
        ''' Returns a list of all the books in this data source matching all of
            the specified non-None criteria.

                author_id - only returns books by the specified author
                search_text - only returns books whose titles contain (case-insensitively) the search text
                start_year - only returns books published during or after this year
                end_year - only returns books published during or before this year

            Note that parameters with value None do not affect the list of books returned.
            Thus, for example, calling books() with no parameters will return JSON for
            a list of all the books in the data source.

            The list of books is sorted in an order depending on the sort_by parameter:

                'year' -- sorts by publication_year, breaking ties with (case-insenstive) title
                default -- sorts by (case-insensitive) title, breaking ties with publication_year

            See the BooksDataSource comment for a description of how a book is represented.

            QUESTION: Should Python interfaces specify TypeError?
            Raises TypeError if author_id, start_year, or end_year is non-None but not an integer.
            Raises TypeError if search_text or sort_by is non-None, but not a string.

            QUESTION: How about ValueError? And if so, for which parameters?
            Raises ValueError if author_id is non-None but is not a valid author ID.
        '''
        output_books_list = list(self.books_raw_data.values())


        if author_id != None:
            if type(author_id) != int:
                raise ValueError

            book_id_list = self._get_book_ids_by_author(author_id)

            def filter_author_id(book):
                if book['id'] in book_id_list:
                    return True
                return False

            temp = output_books_list
            output_books_list = list(filter(filter_author_id, temp))


        if search_text != None:
            if type(search_text) != str:
                raise ValueError

            def filter_search_text(book):
                if search_text.lower() in book['title'].lower():
                    return True
                return False

            temp = output_books_list
            output_books_list = list(filter(filter_search_text, temp))


        if start_year != None:
            if type(start_year) != int:
                raise ValueError

            def filter_start_year(book):
                if book['publication_year'] >= start_year:
                    return True
                return False

            temp = output_books_list
            output_books_list = list(filter(filter_start_year, temp))


        if end_year != None:
            if type(end_year) != int:
                raise ValueError

            def filter_end_year(book):
                if book['publication_year'] <= end_year:
                    return True
                return False

            temp = output_books_list
            output_books_list = list(filter(filter_end_year, temp))

        output_books_list = list(output_books_list)


        if sort_by == "year":
            output_books_list.sort(key = itemgetter('publication_year', 'title'))
        else:
            output_books_list.sort(key = itemgetter('title', 'publication_year'))

        return output_books_list


    def author(self, author_id):
        ''' Returns the author with the specified ID. (See the BooksDataSource comment for a
            description of how an author is represented.)

            Raises ValueError if author_id is not a valid author ID.
        '''
        if type(author_id) != int or author_id < 0 or author_id > len(self.authors_raw_data):
            raise ValueError
        else:
            return self.authors_raw_data[author_id]

    def authors(self, *, book_id=None, search_text=None, start_year=None, end_year=None, sort_by='birth_year'):
        ''' Returns a list of all the authors in this data source matching all of the
            specified non-None criteria.

                book_id - only returns authors of the specified book
                search_text - only returns authors whose first or last names contain
                    (case-insensitively) the search text
                start_year - only returns authors who were alive during or after
                    the specified year
                end_year - only returns authors who were alive during or before
                    the specified year

            Note that parameters with value None do not affect the list of authors returned.
            Thus, for example, calling authors() with no parameters will return JSON for
            a list of all the authors in the data source.

            The list of authors is sorted in an order depending on the sort_by parameter:

                'birth_year' - sorts by birth_year, breaking ties with (case-insenstive) last_name,
                    then (case-insensitive) first_name
                any other value - sorts by (case-insensitive) last_name, breaking ties with
                    (case-insensitive) first_name, then birth_year

            See the BooksDataSource comment for a description of how an author is represented.
        '''
        output_authors_list = list(self.authors_raw_data.values())

        if book_id != None:
            if type(book_id) != int:
                raise ValueError

            author_id_list = self._get_author_ids_by_book(book_id)

            def filter_book_id(author):
                if author['id'] in author_id_list:
                    return True
                return False

            temp = output_authors_list
            output_authors_list = list(filter(filter_book_id, temp))


        if search_text != None:
            if type(search_text) != str:
                raise ValueError

            def filter_search_text(author):
                if search_text.lower() in (author['first_name'] + author['last_name']).lower():
                    return True
                return False

            temp = output_authors_list
            output_authors_list = list(filter(filter_search_text, temp))


        if start_year != None:
            if type(start_year) != int:
                raise ValueError
            if start_year > datetime.datetime.now().year:
                return []

            def filter_start_year(author):
                if author['death_year'] == None or author['death_year'] > start_year:
                    return True
                return False

            temp = output_authors_list
            output_authors_list = list(filter(filter_start_year, temp))

        if end_year != None:
            if type(end_year) != int:
                raise ValueError

            def filter_end_year(author):
                if author['birth_year'] <= end_year:
                    return True
                return False

            temp = output_authors_list
            output_authors_list = list(filter(filter_end_year, temp))

        output_authors_list = list(output_authors_list)

        if sort_by == "birth_year":
            output_authors_list.sort(key = itemgetter('birth_year', 'last_name', 'first_name'))
        else: #sort by title
            output_authors_list.sort(key = itemgetter('last_name', 'first_name', 'birth_year'))

        return output_authors_list




    # Note for my students: The following two methods provide no new functionality beyond
    # what the books(...) and authors(...) methods already provide. But they do represent a
    # category of methods known as "convenience methods". That is, they provide very simple
    # interfaces for a couple very common operations.
    #
    # A question for you: do you think it's worth creating and then maintaining these
    # particular convenience methods? Is books_for_author(17) better than books(author_id=17)?

    def books_for_author(self, author_id):
        ''' Returns a list of all the books written by the author with the specified author ID.
            See the BooksDataSource comment for a description of how an book is represented. '''
        return self.books(author_id=author_id)

    def authors_for_book(self, book_id):
        ''' Returns a list of all the authors of the book with the specified book ID.
            See the BooksDataSource comment for a description of how an author is represented. '''
        return self.authors(book_id=book_id)
