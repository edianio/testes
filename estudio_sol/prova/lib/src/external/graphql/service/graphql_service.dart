import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService{
  late GraphQLClient _client;

  GraphQlService(){
    final HttpLink httpLink = HttpLink('https://us-central1-ss-devops.cloudfunctions.net/GraphQL');
    _client = GraphQLClient(
      link: httpLink,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  Future<QueryResult> performQuery(String query, {required Map<String, dynamic> variables}) async {
    QueryOptions options = QueryOptions(document: gql(query), variables: variables);

    final result = await _client.query(options);

    return result;
  }

  Future<QueryResult> performMutation(String query, {required Map<String, dynamic> variables}) async {
    MutationOptions options = MutationOptions(document: gql(query), variables: variables);

    final result = await _client.mutate(options);

    return result;
  }
}