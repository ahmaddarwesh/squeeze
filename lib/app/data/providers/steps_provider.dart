import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class StepsProvider {
  static var document = r'''  
    query Query($stepsOrderBy: [StepOrderByInput!], $optionsOrderBy: [StepOptionOrderByInput!]) {
      steps(orderBy: $stepsOrderBy) {
        id
        index
        name
        options(orderBy: $optionsOrderBy) {
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

  static Future<QueryResult> getSteps() async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
      variables: {
        "stepsOrderBy": {"id": "asc"},
        "optionsOrderBy": {"id": "asc"},
      },
      // {"index": "asc"}
    );
    return await client.value.mutate(mutationOptions);
  }
}
