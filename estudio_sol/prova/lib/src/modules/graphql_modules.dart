import 'package:prova/src/external/graphql/service/graphql_service.dart';
import 'package:provider/provider.dart';

final graphqlModules = [
  Provider(create: (context) => GraphQlService()),
];