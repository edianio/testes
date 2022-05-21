import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/repositories/book_repository.dart';
import 'package:prova/src/domain/usecases/book/book_by_id.dart';

class EntityMock extends Mock implements BookEntity{}
class RepositoryMock extends Mock implements BookRepository{}

void main(){
  late BookEntity entity;
  late BookRepository repository;
  int id = 1;

  setUp(() {
    entity = EntityMock();
    repository = RepositoryMock();
  });

  test('get one book', () async {
    when(() => repository.bookById(id)).thenAnswer((_) => Future.value(entity));

    final usecase = BookByIdImpl(repository);
    final result = await usecase.call(id);

    expect(result, isA<BookEntity>());
  });
}