import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/repositories/author_repository.dart';

abstract class FavoriteAuthors{
  Stream<List<AuthorEntity>> call();
}

class FavoriteAuthorsImpl implements FavoriteAuthors{
  final AuthorRepository repository;

  FavoriteAuthorsImpl(this.repository);

  @override
  Stream<List<AuthorEntity>> call() => repository.favoriteAuthors();

}