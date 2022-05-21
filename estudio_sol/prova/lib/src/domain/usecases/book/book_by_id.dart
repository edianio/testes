import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/repositories/book_repository.dart';

abstract class BookById{
  Future<BookEntity> call(int id);
}

class BookByIdImpl implements BookById{
  final BookRepository repository;

  BookByIdImpl(this.repository);

  @override
  Future<BookEntity> call(int id) async => repository.bookById(id);
}