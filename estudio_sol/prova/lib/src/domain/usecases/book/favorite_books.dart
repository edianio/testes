import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/repositories/book_repository.dart';

abstract class FavoriteBooks{
  Stream<List<BookEntity>> call();
}

class FavoriteBooksImpl implements FavoriteBooks{
  final BookRepository repository;

  FavoriteBooksImpl(this.repository);

  @override
  Stream<List<BookEntity>> call() => repository.favoriteBooks();
}