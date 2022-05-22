import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/domain/repositories/category_book_repository.dart';
import 'package:prova/src/domain/usecases/category_book/get_category_book.dart';

class EntityMock extends Mock implements CategoryBookEntity{}
class RepositoryMock extends Mock implements CategoryBookRepository{}

void main(){
  late CategoryBookEntity entity;
  late CategoryBookRepository repository;
  String name = 'name';

  setUp(() {
    entity = EntityMock();
    repository = RepositoryMock();
  });

  test('get a category book', () async {
    when(() => repository.getCategoryBook(name)).thenAnswer((_) => Future.value(entity));

    final usecase = GetCategoryBookImpl(repository);
    final result = await usecase.call(name);

    expect(result, isA<CategoryBookEntity>());
  });
}