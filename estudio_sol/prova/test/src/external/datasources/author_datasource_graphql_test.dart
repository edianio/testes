import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/external/datasources/author_datasource_graphql.dart';
import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:prova/src/infra/models/author_model.dart';
import 'package:prova/src/infra/remote/datasource/author_datasource.dart';

class DatasourceMock extends Mock implements AuthorDatasource{}

void main(){
  late GraphQlService service;
  late AuthorDatasource datasource;
  late AuthorEntity entity;

  setUp((){
    entity = AuthorModel(
        id: 1,
        name: faker.person.name(),
        picture: faker.internet.httpUrl(),
        booksCount: 0,
        isFavorite: true,
        books: []);
    service = GraphQlService();
  });

  group('Fake tests', () {
    test('test datasource', () {
      datasource = DatasourceMock();
      when(() => datasource.favoriteAuthors()).thenAnswer((_) => Stream.value([entity]));

      final data = AuthorDatasourceGraphQl(service);
      final result = data.favoriteAuthors();

      expect(result, emits(isA<List<AuthorEntity>>()));
    });
  });

  group('Real tests', () {
    test('test datasource', () {
      datasource = AuthorDatasourceGraphQl(service);
      final result = datasource.favoriteAuthors();

      expect(result, emits(isA<List<AuthorEntity>>()));
    });
  });
}