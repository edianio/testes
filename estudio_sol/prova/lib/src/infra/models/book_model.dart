import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/entities/category_book.dart';

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
      BookModel(id: map['id'] as int,
          name: map['name'] as String,
          author: map['author'] as AuthorEntity,
          cover: map['cover'] as String,
          description: map['description'] as String,
          isFavorite: map['isFavorite'] as bool,
          category: map['category'] as CategoryBookEntity);

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