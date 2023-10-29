import 'controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:tchc/core/app_export.dart';
import 'package:tchc/core/utils/validation_functions.dart';
import 'package:tchc/widgets/app_bar/appbar_leading_image.dart';
import 'package:tchc/widgets/app_bar/appbar_subtitle_two.dart';
import 'package:tchc/widgets/app_bar/custom_app_bar.dart';
import 'package:tchc/widgets/custom_checkbox_button.dart';
import 'package:tchc/widgets/custom_elevated_button.dart';
import 'package:tchc/widgets/custom_text_form_field.dart';
import 'package:tchc/presentation/sign_up_success_dialog/sign_up_success_dialog.dart';
import 'package:tchc/presentation/sign_up_success_dialog/controller/sign_up_success_controller.dart';

// ignore_for_file: must_be_immutable
class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.h, vertical: 40.v),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNameEditText(),
                          SizedBox(height: 16.v),
                          _buildEmailEditText(),
                          SizedBox(height: 16.v),
                          _buildPasswordEditText(),
                          SizedBox(height: 16.v),
                          _buildAgreeCheckBox(),
                          SizedBox(height: 29.v),
                          _buildSignUpButton(),
                          SizedBox(height: 26.v),
                          Padding(
                              padding: EdgeInsets.only(left: 44.h),
                              child: Row(children: [
                                Text("msg_already_have_an".tr,
                                    style: CustomTextStyles.bodyMediumGray600),
                                GestureDetector(
                                    onTap: () {
                                      onTapTxtLogIn();
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(left: 4.h),
                                        child: Text("lbl_log_in2".tr,
                                            style: CustomTextStyles
                                                .titleSmallPrimary_1)))
                              ])),
                          SizedBox(height: 5.v)
                        ])))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar() {
    return CustomAppBar(
        leadingWidth: 64.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgArrowLeft,
            margin: EdgeInsets.only(left: 24.h),
            onTap: () {
              onTapArrowLeft();
            }),
        centerTitle: true,
        title: AppbarSubtitleTwo(text: "lbl_sign_up".tr));
  }

  /// Section Widget
  Widget _buildNameEditText() {
    return CustomTextFormField(
        controller: controller.nameEditTextController,
        hintText: "lbl_enter_your_name".tr,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgUser,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (!isText(value)) {
            return "err_msg_please_enter_valid_text".tr;
          }
          return null;
        },
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildEmailEditText() {
    return CustomTextFormField(
        controller: controller.emailEditTextController,
        hintText: "msg_enter_your_email".tr,
        textInputType: TextInputType.emailAddress,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
        contentPadding: EdgeInsets.only(top: 18.v, right: 30.h, bottom: 18.v));
  }

  /// Section Widget
  Widget _buildPasswordEditText() {
    return Obx(() => CustomTextFormField(
        controller: controller.passwordEditTextController,
        hintText: "msg_enter_your_password".tr,
        textInputAction: TextInputAction.done,
        textInputType: TextInputType.visiblePassword,
        prefix: Container(
            margin: EdgeInsets.fromLTRB(24.h, 16.v, 16.h, 16.v),
            child: CustomImageView(
                imagePath: ImageConstant.imgLock,
                height: 24.adaptSize,
                width: 24.adaptSize)),
        prefixConstraints: BoxConstraints(maxHeight: 56.v),
        suffix: InkWell(
            onTap: () {
              controller.isShowPassword.value =
                  !controller.isShowPassword.value;
            },
            child: Container(
                margin: EdgeInsets.fromLTRB(30.h, 16.v, 24.h, 16.v),
                child: CustomImageView(
                    imagePath: ImageConstant.imgCheckmarkGray500,
                    height: 24.adaptSize,
                    width: 24.adaptSize))),
        suffixConstraints: BoxConstraints(maxHeight: 56.v),
        validator: (value) {
          if (value == null || (!isValidPassword(value, isRequired: true))) {
            return "err_msg_please_enter_valid_password".tr;
          }
          return null;
        },
        obscureText: controller.isShowPassword.value));
  }

  /// Section Widget
  Widget _buildAgreeCheckBox() {
    return Padding(
        padding: EdgeInsets.only(right: 28.h),
        child: Obx(() => CustomCheckboxButton(
            text: "msg_i_agree_to_the_medidoc".tr,
            isExpandedText: true,
            value: controller.agreeCheckBox.value,
            onChange: (value) {
              controller.agreeCheckBox.value = value;
            })));
  }

  /// Section Widget
  Widget _buildSignUpButton() {
    return CustomElevatedButton(
        text: "lbl_sign_up".tr,
        onPressed: () {
          onTapSignUpButton();
        });
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Displays a dialog with the [SignUpSuccessDialog] content.
  onTapSignUpButton() {
    Get.dialog(AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      insetPadding: const EdgeInsets.only(left: 0),
      content: SignUpSuccessDialog(
        Get.put(
          SignUpSuccessController(),
        ),
      ),
    ));
  }

  /// Navigates to the loginScreen when the action is triggered.
  onTapTxtLogIn() {
    Get.toNamed(
      AppRoutes.loginScreen,
    );
  }
}
