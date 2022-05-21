import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/repositories/book_repository.dart';
import 'package:prova/src/infra/remote/datasource/book_datasource.dart';

class BookRepositoryImpl implements BookRepository{
  final BookDatasource datasource;

  BookRepositoryImpl(this.datasource);

  @override
  Stream<List<BookEntity>> allBooks() => datasource.allBooks();

  @override
  Future<BookEntity> bookById(int id) async => datasource.bookById(id);

  @override
  Stream<List<BookEntity>> favoriteBooks() => datasource.favoriteBooks();
}