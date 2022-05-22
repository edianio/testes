import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/infra/models/book_model.dart';

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
      id: int.parse(map['id'] as String),
      name: map['name'] as String,
      picture: map['picture'] as String,
      booksCount: map['booksCount'] as int,
      isFavorite: map['isFavorite'] as bool,
      books: map['books'] != null ? [
        if((map['books'] as List).isNotEmpty)
          ... (map['books'] as List).map((e) => BookModel.fromMap(e)).toList(),
      ] : [],
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'picture': picture,
    'booksCount': booksCount,
    'isFavorite': isFavorite,
    'books': books,
  };
}