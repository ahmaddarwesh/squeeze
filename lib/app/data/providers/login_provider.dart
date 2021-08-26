import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class LoginProvider {
  static var document = r'''
      mutation LoginMutation($loginLoginInputData: LoginInputData!) {
        login(LoginInputData: $loginLoginInputData) {
          isSuccess
          message
        }
      }
   ''';

  static Future<QueryResult> login(String phoneNumber) async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
      variables: {
        "loginLoginInputData": {"phoneNumber": "971" + phoneNumber},
      },
    );
    return await client.value.mutate(mutationOptions);
  }
}
