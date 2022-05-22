import 'package:prova/src/domain/entities/category_book.dart';

abstract class CategoryBookRepository{
  Future<CategoryBookEntity> getCategoryBook(String name);
}