import 'package:prova/src/domain/repositories/book_repository.dart';
import 'package:prova/src/domain/usecases/book/all_books.dart';
import 'package:prova/src/domain/usecases/book/book_by_id.dart';
import 'package:prova/src/domain/usecases/book/favorite_books.dart';
import 'package:prova/src/infra/repositories/book_repository_impl.dart';
import 'package:provider/provider.dart';

final bookModules = [
  //DATASOURCE
  //REPOSITORY
  Provider<BookRepository>(create: (context) => BookRepositoryImpl(context.read())),
  //USECASES
  Provider<AllBooks>(create: (context) => AllBooksImpl(context.read())),
  Provider<FavoriteBooks>(create: (context) => FavoriteBooksImpl(context.read())),
  Provider<BookById>(create: (context) => BookByIdImpl(context.read())),
  //BLOC
];