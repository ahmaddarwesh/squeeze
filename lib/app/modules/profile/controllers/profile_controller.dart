import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:squeeze/app/core/client/graphql_client.dart';
import 'package:squeeze/app/core/constant/app_constants.dart';
import 'package:squeeze/app/core/functions/dialogs.dart';
import 'package:squeeze/app/core/logger/logger.dart';
import 'package:squeeze/app/core/sessions/sessions.dart';
import 'package:squeeze/app/data/models/update_profie_input_model.dart';
import 'package:squeeze/app/data/models/user_model.dart';
import 'package:squeeze/app/data/providers/update_profile_provider.dart';
import 'package:squeeze/app/data/repositories/me_repository.dart';

class ProfileController extends GetxController {
  User user = User();
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  UpdateProfileInput updateProfileInput = UpdateProfileInput();
  var canUpdate = false;
  var startValidate = false;

  late GlobalKey<FormState> formData;

  updateProfile() async {
    if (formData.currentState!.validate()) {
      prepareInput();
      showLoading();
      l(debug: updateProfileInput.toJson());
      await UpdateProfileProvider.update(updateProfileInput).then((value) {
        if (value.hasException)
          printTheError(exception: value.exception);
        else {
          var user = User.fromJson(value.data!["updateUser"]);
          l(debug: user.toJson());
          MeRepository.saveProfile(user);
          this.user = user;
          changeCanUpdate();
        }
      });
      hideLoading();
    } else {
      startValidate = true;
      update();
    }
  }

  void prepareInput() {
    updateProfileInput = UpdateProfileInput(
      updateUserData: UpdateUserData(
        firstName: FirstName(set: firstNameController.text),
        email: Email(set: emailController.text),
        lastName: LastName(set: lastNameController.text),
      ),
      updateUserWhere: {},
    );
  }

  changeCanUpdate() {
    if (user.firstName != firstNameController.text ||
        user.lastName != lastNameController.text ||
        user.email != emailController.text) {
      canUpdate = true;
    } else {
      canUpdate = false;
    }
    update();
  }

  String? nameValidation(String? data) {
    if (data!.trim() == '') {
      return "Field Required";
    }
    return null;
  }

  String? emailValidate(String? data) {
    if (emailController.text.trim() != '') {
      if (!emailController.text.trim().isEmail) {
        return "Invalid Email Address";
      }
    }
    return null;
  }

  @override
  void onInit() {
    user = User.fromJson(Sessions.read(MY_PROFILE_INFO));

    firstNameController = TextEditingController(text: user.firstName);
    lastNameController = TextEditingController(text: user.lastName);
    emailController = TextEditingController(text: user.email);
    phoneNumberController = TextEditingController(text: user.phoneNumber!.split("971")[1]);
    formData = GlobalKey<FormState>();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
