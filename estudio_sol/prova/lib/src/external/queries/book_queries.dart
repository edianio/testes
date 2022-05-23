const String bookQuery = '''
    query readBook(\$id: ID!){
      book(id: \$id){
            id,
            name,
            author{
                  id,
                  name,
                  picture,
                  booksCount,
                  isFavorite,
            },
            cover,
            description,
            isFavorite,
            category
      },
    }
      ''';

const String allBooksQuery = '''
    query{
      allBooks{
            id,
            name,
            author{
                  id,
                  name,
                  picture,
                  booksCount,
                  isFavorite,
            },
            cover,
            description,
            isFavorite,
            category
      },
    }
      ''';

const String favoriteBooksQuery = '''
    query{
      favoriteBooks{
            id,
            name,
            author{
                  id,
                  name,
                  picture,
                  booksCount,
                  isFavorite,
            },
            cover,
            description,
            isFavorite,
            category
      },
    }
      ''';