import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/repositories/book_repository.dart';

abstract class AllBooks{
  Stream<List<BookEntity>> call();
}

class AllBooksImpl implements AllBooks{
  final BookRepository repository;

  AllBooksImpl(this.repository);

  @override
  Stream<List<BookEntity>> call() => repository.allBooks();
}