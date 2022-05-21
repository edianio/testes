import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/repositories/book_repository.dart';
import 'package:prova/src/domain/usecases/book/favorite_books.dart';

class EntityMock extends Mock implements BookEntity{}
class RepositoryMock extends Mock implements BookRepository{}

void main(){
  late BookEntity entity;
  late BookRepository repository;

  setUp(() {
    entity = EntityMock();
    repository = RepositoryMock();
  });

  test('get favorite books', () {
    when(() => repository.favoriteBooks()).thenAnswer((_) => Stream.value([entity]));

    final usecase = FavoriteBooksImpl(repository);
    final result = usecase.call();

    expect(result, emits(isA<List<BookEntity>>()));
  });
}