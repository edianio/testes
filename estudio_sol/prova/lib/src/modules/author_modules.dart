import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/domain/repositories/author_repository.dart';
import 'package:prova/src/domain/usecases/author/favorite_authors.dart';
import 'package:prova/src/external/datasources/author_datasource_graphql.dart';
import 'package:prova/src/infra/remote/datasource/author_datasource.dart';
import 'package:prova/src/infra/repositories/author_repository_impl.dart';
import 'package:prova/src/presentation/blocs/author/author_bloc.dart';
import 'package:provider/provider.dart';

final authorModules = [
  //DATASOURCE
  Provider<AuthorDatasource>(create: (context) => AuthorDatasourceGraphQl(context.read())),
  //REPOSITORY
  Provider<AuthorRepository>(create: (context) => AuthorRepositoryImpl(context.read())),
  //USECASES
  Provider<FavoriteAuthors>(create: (context) => FavoriteAuthorsImpl(context.read())),
  //BLOC
  BlocProvider(create: (context) => AuthorBloc(context.read())),
];