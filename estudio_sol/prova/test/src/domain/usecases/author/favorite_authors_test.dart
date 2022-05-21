import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/repositories/author_repository.dart';
import 'package:prova/src/domain/usecases/author/favorite_authors.dart';

class EntityMock extends Mock implements AuthorEntity{}
class RepositoryMock extends Mock implements AuthorRepository{}

void main(){
  late AuthorEntity entity;
  late AuthorRepository repository;

  setUp(() {
    entity = EntityMock();
    repository = RepositoryMock();
  });

  test('get favorite authors', () {
    when(() => repository.favoriteAuthors()).thenAnswer((_) => Stream.value([entity]));

    final usecase = FavoriteAuthorsImpl(repository);
    final result = usecase.call();

    expect(result, emits(isA<List<AuthorEntity>>()));
  });
}