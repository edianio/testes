import 'package:prova/src/domain/repositories/user_repository.dart';
import 'package:prova/src/domain/usecases/user/user_picture.dart';
import 'package:prova/src/infra/repositories/user_repository_impl.dart';
import 'package:provider/provider.dart';

final userModules = [
  //DATASOURCE
  //REPOSITORY
  Provider<UserRepository>(create: (context) => UserRepositoryImpl(context.read())),
  //USECASES
  Provider<UserPicture>(create: (context) => UserPictureImpl(context.read())),
  //BLOC
];