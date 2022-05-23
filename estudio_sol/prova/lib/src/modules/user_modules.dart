import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prova/src/domain/repositories/user_repository.dart';
import 'package:prova/src/domain/usecases/user/user_picture.dart';
import 'package:prova/src/external/datasources/user_datasource_graphql.dart';
import 'package:prova/src/infra/remote/datasource/user_datasource.dart';
import 'package:prova/src/infra/repositories/user_repository_impl.dart';
import 'package:prova/src/presentation/blocs/user/user_bloc.dart';
import 'package:provider/provider.dart';

final userModules = [
  //DATASOURCE
  Provider<UserDatasource>(create: (context) => UserDatasourceGraphQl(context.read())),
  //REPOSITORY
  Provider<UserRepository>(create: (context) => UserRepositoryImpl(context.read())),
  //USECASES
  Provider<UserPicture>(create: (context) => UserPictureImpl(context.read())),
  //BLOC
  BlocProvider(create: (context) => UserBloc(context.read())),
];