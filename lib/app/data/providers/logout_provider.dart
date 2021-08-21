import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class LogoutProvider {
  static final document = r''' 
  mutation LogoutMutation {
    logout
  }
  ''';

  static Future<QueryResult> logOut() async {
    var mutationOptions = MutationOptions(document: gql(document));
    return await Client().getClient().value.mutate(mutationOptions);
  }
}
