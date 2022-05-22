import 'package:prova/src/domain/repositories/category_book_repository.dart';
import 'package:prova/src/domain/usecases/category_book/get_category_book.dart';
import 'package:prova/src/infra/repositories/category_book_repository_impl.dart';
import 'package:provider/provider.dart';

final categoryBookModules = [
  //DATASOURCE
  //REPOSITORY
  Provider<CategoryBookRepository>(create: (context) => CategoryBookRepositoryImpl(context.read())),
  //USECASES
  Provider<GetCategoryBook>(create: (context) => GetCategoryBookImpl(context.read())),
  //BLOC
];