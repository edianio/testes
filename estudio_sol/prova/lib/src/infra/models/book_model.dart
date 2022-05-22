import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/infra/models/author_model.dart';
import 'package:prova/src/infra/models/category_book_model.dart';

class BookModel extends BookEntity{
  BookModel(
      {required super.id,
      required super.name,
      required super.author,
      required super.cover,
      required super.description,
      required super.isFavorite,
      required super.category});

  factory BookModel.fromMap(Map<String, dynamic> map) =>
      BookModel(
          id: int.parse(map['id'] as String),
          name: map['name'] as String,
          author: AuthorModel.fromMap(map['author']),
          cover: map['cover'] as String,
          description: map['description'] as String,
          isFavorite: map['isFavorite'] as bool,
          category: CategoryBookModel.fromString(map['category'] as String)
      );

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'author': author,
    'cover': cover,
    'description': description,
    'isFavorite': isFavorite,
    'category': category,
  };
}