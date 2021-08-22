import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';
import 'package:squeeze/app/data/models/register_model.dart';

class RegisterProvider {
  static var document = r'''
       mutation RegisterMutation($registerRegisterInputData: RegisterInputData!) {
          register(RegisterInputData: $registerRegisterInputData) {
            message
            isSuccess
          } 
      }
   ''';

  static Future<QueryResult> register(RegisterInput input) async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
      variables: input.toJson(),
    );
    return await client.value.mutate(mutationOptions);
  }
}
