import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class ServicesProvider {
  static var document = r'''
      query Query{
        services  {
          id
          name
          name_ar
        }
      }
   ''';

  static Future<QueryResult> getServices() async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
    );
    return await client.value.mutate(mutationOptions);
  }
}
