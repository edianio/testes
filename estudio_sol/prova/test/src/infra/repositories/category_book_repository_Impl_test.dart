import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/infra/models/category_book_model.dart';
import 'package:prova/src/infra/remote/datasource/category_book_datasource.dart';
import 'package:prova/src/infra/repositories/category_book_repository_impl.dart';

class DatasourceMock extends Mock implements CategoryBookDatasource{}

void main(){
  late CategoryBookDatasource datasource;
  late CategoryBookEntity entity;
  int id = 1;

  setUp((){
    datasource = DatasourceMock();
    entity = CategoryBookModel(name: 'name');
  });

  test('get a category by name', () async {
    when(() => datasource.getCategoryBook(entity.name)).thenAnswer((_) => Future.value(entity));

    final repository = CategoryBookRepositoryImpl(datasource);
    final result = await repository.getCategoryBook(entity.name);

    expect(result, isA<CategoryBookEntity>());
  });
}