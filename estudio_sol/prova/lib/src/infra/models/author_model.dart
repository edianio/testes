import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/entities/book_entity.dart';

class AuthorModel extends AuthorEntity{
  AuthorModel(
      {required super.id,
      required super.name,
      required super.picture,
      required super.booksCount,
      required super.isFavorite,
      required super.books});

  factory AuthorModel.fromMap(Map<String, dynamic> map) =>
      AuthorModel(
      id: map['id'] as int,
      name: map['name'] as String,
      picture: map['picture'] as String,
      booksCount: map['booksCount'] as int,
      isFavorite: map['isFavorite'] as bool,
      books: map['books'] as List<BookEntity>);

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'picture': picture,
    'booksCount': booksCount,
    'isFavorite': isFavorite,
    'books': books,
  };
}