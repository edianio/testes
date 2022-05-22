import 'package:prova/src/domain/entities/category_book.dart';

abstract class CategoryBookDatasource{
  Future<CategoryBookEntity> getCategoryBook(String name);
}