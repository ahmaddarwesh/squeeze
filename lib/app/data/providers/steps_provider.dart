import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class StepsProvider {
  static var document = r'''  
    query Query($stepsOrderBy: [StepOrderByInput!]) {
      steps(orderBy: $stepsOrderBy) {
        id
        index
        name
        options {
          id
          name
          name_ar
          description
          description_ar
          index
          type
          settings
          stepId
        }
      }
    }
  ''';
  static Future<QueryResult> getSteps({orderBy}) async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
      variables: {"stepsOrderBy": orderBy},
      // {"index": "asc"}
    );
    return await client.value.mutate(mutationOptions);
  }
}
