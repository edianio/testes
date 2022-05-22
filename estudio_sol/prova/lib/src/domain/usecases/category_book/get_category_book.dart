import 'package:prova/src/domain/entities/category_book.dart';
import 'package:prova/src/domain/repositories/category_book_repository.dart';

abstract class GetCategoryBook{
  Future<CategoryBookEntity> call(String name);
}

class GetCategoryBookImpl implements GetCategoryBook{
  final CategoryBookRepository repository;

  GetCategoryBookImpl(this.repository);

  @override
  Future<CategoryBookEntity> call(String name) => repository.getCategoryBook(name);
}