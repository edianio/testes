import 'package:prova/src/domain/entities/author_entity.dart';

abstract class AuthorDatasource{
  Stream<List<AuthorEntity>> favoriteAuthors();
}