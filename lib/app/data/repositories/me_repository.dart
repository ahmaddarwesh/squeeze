import 'package:squeeze/app/core/client/graphql_client.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/data/models/user_model.dart';
import 'package:squeeze/app/data/providers/me_provider.dart';
import 'package:squeeze/app_controller.dart';

class MeRepository {
  static Future<User?> getProfile() async {
    User? user;
    var result = await MeProvider.getProfile();
    if (!result.hasException) {
      var meJson = result.data!['me'];
      user = User.fromJson(meJson);
    } else {
      printTheError(exception: result.exception);
    }
    if (user!.id != null) saveProfile(user);
    return user;
  }

  static void saveProfile(User user) {
    Sessions.write(MY_PROFILE_INFO, user);
    AppController.to.user = user;
  }
}
