import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/infra/remote/datasource/author_datasource.dart';
import 'package:prova/src/infra/repositories/author_repository_impl.dart';

class DatasourceMock extends Mock implements AuthorDatasource{}

void main(){
  late AuthorDatasource datasource;
  late AuthorEntity entity;
  int id = 1;

  setUp((){
    datasource = DatasourceMock();
    entity = AuthorEntity(
        id: id,
        name: faker.person.name(),
        picture: faker.internet.httpUrl(),
        booksCount: 0,
        isFavorite: true,
        books: []
    );
  });

  test('get favorite authors', () {
    when(() => datasource.favoriteAuthors()).thenAnswer((_) => Stream.value([entity]));

    final repository = AuthorRepositoryImpl(datasource);
    final result = repository.favoriteAuthors();

    expect(result, emits(isA<List<AuthorEntity>>()));
  });
}