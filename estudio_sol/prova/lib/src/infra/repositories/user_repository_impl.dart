import 'package:prova/src/domain/repositories/user_repository.dart';
import 'package:prova/src/infra/remote/datasource/user_datasource.dart';

class UserRepositoryImpl implements UserRepository{
  final UserDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Stream<String> userPicture() => datasource.userPicture();
}