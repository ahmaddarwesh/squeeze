import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';
import 'package:squeeze/app/data/models/update_profile_input_model.dart';

class UpdateProfileProvider {
  static var document = r'''
      mutation UpdateUserMutation($updateUserData: UserUpdateInput!, $updateUserWhere: UserWhereUniqueInput!) {
        updateUser(data: $updateUserData, where: $updateUserWhere) {
          email
          firstName
          id
          lastName
          loginConfirmedAt
          phoneNumber
          points
          role
          updatedAt
          createdAt 
        }
      }
   ''';

  static Future<QueryResult> update(UpdateProfileInput updateProfileInput) async {
    var client = await Client().getClient();
    var mutationOptions = MutationOptions(
      document: gql(document),
      variables: updateProfileInput.toJson(),
    );
    return await client.value.mutate(mutationOptions);
  }
}
