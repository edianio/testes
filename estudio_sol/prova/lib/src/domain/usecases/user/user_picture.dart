import 'package:prova/src/domain/repositories/user_repository.dart';

abstract class UserPicture{
  Stream<String> call();
}

class UserPictureImpl implements UserPicture{
  final UserRepository repository;

  UserPictureImpl(this.repository);

  @override
  Stream<String> call() => repository.userPicture();
}