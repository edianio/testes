import 'package:prova/src/domain/repositories/author_repository.dart';
import 'package:prova/src/domain/usecases/author/favorite_authors.dart';
import 'package:prova/src/infra/repositories/author_repository_impl.dart';
import 'package:provider/provider.dart';

final authorModules = [
  //DATASOURCE
  //REPOSITORY
  Provider<AuthorRepository>(create: (context) => AuthorRepositoryImpl(context.read())),
  //USECASES
  Provider<FavoriteAuthors>(create: (context) => FavoriteAuthorsImpl(context.read())),
  //BLOC
];