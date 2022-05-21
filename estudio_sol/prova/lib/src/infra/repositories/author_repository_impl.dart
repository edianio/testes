import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/domain/repositories/author_repository.dart';
import 'package:prova/src/infra/remote/datasource/author_datasource.dart';

class AuthorRepositoryImpl implements AuthorRepository{
  final AuthorDatasource datasource;

  AuthorRepositoryImpl(this.datasource);

  @override
  Stream<List<AuthorEntity>> favoriteAuthors() => datasource.favoriteAuthors();
}