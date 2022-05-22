import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/domain/repositories/category_book_repository.dart';
import 'package:prova/src/infra/remote/datasource/category_book_datasource.dart';

class CategoryBookRepositoryImpl implements CategoryBookRepository{
  final CategoryBookDatasource datasource;

  CategoryBookRepositoryImpl(this.datasource);

  @override
  Future<CategoryBookEntity> getCategoryBook(String name) async => datasource.getCategoryBook(name);
}