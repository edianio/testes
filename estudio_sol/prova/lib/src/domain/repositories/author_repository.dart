import 'package:prova/src/domain/entities/author_entity.dart';

abstract class AuthorRepository{
  Stream<List<AuthorEntity>> favoriteAuthors();
}