import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class MeProvider {
  static var document = r''' 
    query Query {
      me {
        createdAt
        email
        firstName
        id
        lastName
        loginConfirmedAt
        phoneNumber
        points
        role
        updatedAt
      }
    } 
   ''';

  static Future<QueryResult> getProfile() async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
    );
    return await client.value.mutate(mutationOptions);
  }
}
