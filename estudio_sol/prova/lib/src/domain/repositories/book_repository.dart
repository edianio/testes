import 'package:prova/src/domain/entities/book_entity.dart';

abstract class BookRepository{
  Stream<List<BookEntity>> allBooks();
  Stream<List<BookEntity>> favoriteBooks();
  Future<BookEntity> bookById(int id);
}