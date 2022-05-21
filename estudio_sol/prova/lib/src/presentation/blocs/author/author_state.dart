import 'package:prova/src/domain/entities/author_entity.dart';

abstract class AuthorState{}

class EmptyAuthorState implements AuthorState{}

class LoadingAuthorState implements AuthorState{}

class LoadedAuthorState implements AuthorState{
  final List<AuthorEntity> authors;

  LoadedAuthorState(this.authors);
}

class ExceptionAuthorState implements AuthorState{
  final String error;

  ExceptionAuthorState(this.error);
}