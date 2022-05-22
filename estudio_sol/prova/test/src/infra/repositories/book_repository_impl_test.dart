import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/entities/book_entity.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/infra/remote/datasource/book_datasource.dart';
import 'package:prova/src/infra/repositories/book_repository_impl.dart';

class DatasourceMock extends Mock implements BookDatasource{}
class AuthorMock extends Mock implements AuthorEntity{}

void main(){
  late BookDatasource datasource;
  late BookEntity entity;
  late CategoryBookEntity category;
  late AuthorEntity author;
  int id = 1;

  setUp((){
    datasource = DatasourceMock();
    author = AuthorMock();
    category = CategoryBookEntity(name: 'Romance');
    entity = BookEntity(
        id: id,
        name: faker.person.name(),
        author: author,
        cover: faker.internet.httpUrl(),
        description: faker.lorem.random.toString(),
        isFavorite: true,
        category: category,
    );
  });

  test('get all books', () {
    when(() => datasource.allBooks()).thenAnswer((_) => Stream.value([entity]));

    final repository = BookRepositoryImpl(datasource);
    final result = repository.allBooks();

    expect(result, emits(isA<List<BookEntity>>()));
  });

  test('get favorite books', () {
    when(() => datasource.favoriteBooks()).thenAnswer((_) => Stream.value([entity]));

    final repository = BookRepositoryImpl(datasource);
    final result = repository.favoriteBooks();

    expect(result, emits(isA<List<BookEntity>>()));
  });

  test('get one book by id', () async {
    when(() => datasource.bookById(id)).thenAnswer((_) => Future.value(entity));

    final repository = BookRepositoryImpl(datasource);
    final result = await repository.bookById(id);

    expect(result, isA<BookEntity>());
  });
}