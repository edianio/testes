import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/user_entity.dart';
import 'package:prova/src/infra/remote/datasource/user_datasource.dart';
import 'package:prova/src/infra/repositories/user_repository_impl.dart';

class DatasourceMock extends Mock implements UserDatasource{}

void main(){
  late UserDatasource datasource;
  late UserEntity entity;

  setUp((){
    datasource = DatasourceMock();
    entity = UserEntity(userPicture: faker.internet.httpUrl());
  });

  test('get user picture', () {
    when(() => datasource.userPicture()).thenAnswer((_) => Stream.value(entity.userPicture));

    final repository = UserRepositoryImpl(datasource);
    final result = repository.userPicture();

    expect(result, emits(isA<String>()));
  });
}