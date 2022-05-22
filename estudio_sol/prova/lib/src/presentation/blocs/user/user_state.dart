import 'package:prova/src/domain/entities/user_entity.dart';

abstract class UserState{}

class EmptyUserState implements UserState{}

class LoadingUserState implements UserState{}

class LoadedUserPictureState implements UserState{
  final String picture;

  LoadedUserPictureState(this.picture);
}

class ExceptionUserState implements UserState{
  final String error;

  ExceptionUserState(this.error);
}