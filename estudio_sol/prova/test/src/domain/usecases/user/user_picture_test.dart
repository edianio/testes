import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/user_entity.dart';
import 'package:prova/src/domain/repositories/user_repository.dart';
import 'package:prova/src/domain/usecases/user/user_picture.dart';

class RepositoryMock extends Mock implements UserRepository{}

void main(){
  late UserEntity entity;
  late UserRepository repository;

  setUp(() {
    entity = UserEntity(userPicture: faker.internet.httpUrl());
    repository = RepositoryMock();
  });

  test('get user picture', () {
    when(() => repository.userPicture()).thenAnswer((_) => Stream.value(entity.userPicture));

    final usecase = UserPictureImpl(repository);
    final result = usecase.call();

    expect(result, emits(isA<String>()));
  });
}