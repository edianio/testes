import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/user_entity.dart';
import 'package:prova/src/external/datasources/user_datasource_graphql.dart';
import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:prova/src/infra/models/user_model.dart';
import 'package:prova/src/infra/remote/datasource/user_datasource.dart';

class DatasourceMock extends Mock implements UserDatasource{}

void main(){
  late GraphQlService service;
  late UserDatasource datasource;
  late UserEntity entity;

  setUp((){
    entity = UserModel(userPicture: faker.internet.httpUrl());
    service = GraphQlService();
  });

  group('Fake tests', () {
    test('test datasource', () {
      datasource = DatasourceMock();
      when(() => datasource.userPicture()).thenAnswer((_) => Stream.value(entity.userPicture));

      final data = UserDatasourceGraphQl(service);
      final result = data.userPicture();

      expect(result, emits(isA<String>()));
    });
  });

  group('Real tests', () {
    test('test datasource', () {
      datasource = UserDatasourceGraphQl(service);
      final result = datasource.userPicture();

      expect(result, emits(isA<String>()));
    });
  });
}