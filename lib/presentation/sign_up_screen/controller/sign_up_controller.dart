import 'package:tchc/core/app_export.dart';
import 'package:tchc/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the SignUpScreen.
///
/// This class manages the state of the SignUpScreen, including the
/// current signUpModelObj
class SignUpController extends GetxController {
  TextEditingController nameEditTextController = TextEditingController();

  TextEditingController emailEditTextController = TextEditingController();

  TextEditingController passwordEditTextController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> agreeCheckBox = false.obs;

  @override
  void onClose() {
    super.onClose();
    nameEditTextController.dispose();
    emailEditTextController.dispose();
    passwordEditTextController.dispose();
  }
}
