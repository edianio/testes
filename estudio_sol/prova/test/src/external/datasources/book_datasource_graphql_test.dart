import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/external/datasources/book_datasource_graphql.dart';
import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:prova/src/infra/models/book_model.dart';
import 'package:prova/src/infra/models/category_book_model.dart';
import 'package:prova/src/infra/remote/datasource/book_datasource.dart';

class DatasourceMock extends Mock implements BookDatasource{}
class AuthorMock extends Mock implements AuthorEntity{}

void main(){
  late GraphQlService service;
  late BookDatasource datasource;
  late BookEntity entity;
  late AuthorEntity author;
  int id = 1;

  setUp((){
    author = AuthorMock();
    entity = BookModel(
        id: id,
        name: faker.person.name(),
        author: author,
        cover: faker.internet.httpUrl(),
        description: faker.lorem.random.toString(),
        isFavorite: true,
        category: CategoryBookModel.fromString('TECHNOLOGY'));
    service = GraphQlService();
  });

  group('Fake tests', () {
    test('query allBooks', () {
      datasource = DatasourceMock();
      when(() => datasource.allBooks()).thenAnswer((_) => Stream.value([entity]));

      final data = BookDatasourceGraphQl(service);
      final result = data.allBooks();

      expect(result, emits(isA<List<BookEntity>>()));
    });

    test('query favoriteBooks', () {
      datasource = DatasourceMock();
      when(() => datasource.favoriteBooks()).thenAnswer((_) => Stream.value([entity]));

      final data = BookDatasourceGraphQl(service);
      final result = data.favoriteBooks();

      expect(result, emits(isA<List<BookEntity>>()));
    });

    test('query book', () async {
      datasource = DatasourceMock();
      when(() => datasource.bookById(id)).thenAnswer((_) => Future.value(entity));

      final data = BookDatasourceGraphQl(service);
      final result = await data.bookById(id);

      expect(result, isA<BookEntity>());
    });
  });

  group('Real tests', () {
    test('query allBooks', () {
      datasource = BookDatasourceGraphQl(service);
      final result = datasource.allBooks();

      expect(result, emits(isA<List<BookEntity>>()));
    });

    test('query favoriteBooks', () {
      datasource = BookDatasourceGraphQl(service);
      final result = datasource.favoriteBooks();

      expect(result, emits(isA<List<BookEntity>>()));
    });

    test('query book', () async {
      datasource = BookDatasourceGraphQl(service);
      final result = await datasource.bookById(id);

      expect(result, isA<BookEntity>());
    });
  });
}