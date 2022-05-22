import 'package:equatable/equatable.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/entities/category_book.dart';

class BookEntity extends Equatable{
  int id;
  String name;
  AuthorEntity author;
  String cover;
  String description;
  bool isFavorite;
  CategoryBookEntity category;

  BookEntity(
      {required this.id,
      required this.name,
      required this.author,
      required this.cover,
      required this.description,
      required this.isFavorite,
      required this.category});

  @override
  List<Object?> get props =>
      [id, name, author, cover, description, isFavorite, category];
}