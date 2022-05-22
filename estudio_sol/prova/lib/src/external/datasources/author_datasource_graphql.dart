import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:prova/src/domain/entities/author_entity.dart';
import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:prova/src/external/queries/author_queries.dart';
import 'package:prova/src/infra/models/author_model.dart';
import 'package:prova/src/infra/remote/datasource/author_datasource.dart';

class AuthorDatasourceGraphQl implements AuthorDatasource{
  GraphQlService service;

  AuthorDatasourceGraphQl(this.service);

  @override
  Stream<List<AuthorEntity>> favoriteAuthors() async* {
    final List<AuthorEntity> listAuthors = [];
    service = GraphQlService();

    try{
      await service.performQuery(favoriteAuthorsQuery, variables: {}).then((queryResult) {
        //print(queryResult.data?['favoriteAuthors']);
        //print('TYPE ${queryResult.data?['favoriteAuthors'].runtimeType}');
        final List<dynamic> list = queryResult.data?['favoriteAuthors'];
        for(int i=0; i<list.length; i++){
          //print(list[i]);
          final Map<String,dynamic> map = list[i];
          // print(map['name']);
          // print(map['books']);
          listAuthors.add(AuthorModel.fromMap(map));
        }

        return null;
      });
    } on Exception catch(error){
      print('ERROR: $error');
      throw const ServerException();
    }

    yield listAuthors;
  }
}