import 'package:prova/src/errors/exceptions.dart';
import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:prova/src/external/queries/user_queries.dart';
import 'package:prova/src/infra/remote/datasource/user_datasource.dart';

class UserDatasourceGraphQl implements UserDatasource{
  final GraphQlService service;

  UserDatasourceGraphQl(this.service);

  @override
  Stream<String> userPicture() async* {
    String picture = '';

    try{
      await service.performQuery(userPictureQuery, variables: {}).then((queryResult) {
        picture = queryResult.data?['userPicture'];
        return null;
      });
    } on Exception catch(error){
      print('ERROR: $error');
      throw ServerException();
    }

    yield picture;
  }
}