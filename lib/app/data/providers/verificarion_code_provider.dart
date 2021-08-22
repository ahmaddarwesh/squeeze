import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';

class VerificationCodeProvider {
  static var document = r''' 
      mutation VerifyOTPMutation($verifyOtpOtPinCode: String!) {
        verifyOTP(OTPcode: $verifyOtpOtPinCode) {
          message 
        }
      }
   ''';

  static Future<QueryResult> verify(String input) async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
        document: gql(document),
        variables: {"verifyOtpOtPinCode": input.toString()});
    return await client.value.mutate(mutationOptions);
  }
}
