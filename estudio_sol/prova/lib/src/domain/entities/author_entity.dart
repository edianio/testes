import 'package:equatable/equatable.dart';
import 'package:prova/src/domain/entities/book_entity.dart';

class AuthorEntity extends Equatable{
  int id;
  String name;
  String picture;
  int booksCount;
  bool isFavorite;
  List<BookEntity> books;

  AuthorEntity(
      {required this.id,
      required this.name,
      required this.picture,
      required this.booksCount,
      required this.isFavorite,
      required this.books});

  @override
  List<Object?> get props => [id, name, picture, booksCount, isFavorite, books];
}