import 'controller/app_navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:tchc/core/app_export.dart';

// ignore_for_file: must_be_immutable
class AppNavigationScreen extends GetWidget<AppNavigationController> {
  const AppNavigationScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFFFFFFFF),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildAppNavigation(),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                    ),
                    child: Column(
                      children: [
                        _buildScreenTitle(
                          userName: "Splash Screen".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.splashScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Onboarding One".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingOneScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Onboarding Two".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingTwoScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Onboarding Three".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingThreeScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Onboarding Four".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.onboardingFourScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Login".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.loginScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Sign Up".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.signUpScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Reset Password - Email - Tab Container".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.resetPasswordEmailTabContainerScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Reset Password - Verify Code".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.resetPasswordVerifyCodeScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Create New Password".tr,
                          onTapScreenTitle: () => onTapScreenTitle(
                              AppRoutes.createNewPasswordScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Home - Container".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.homeContainerScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Top Doctor".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.topDoctorScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Find Doctors".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.findDoctorsScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Doctor Detail".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.doctorDetailScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Booking Doctor".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.bookingDoctorScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Chat with Doctor".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.chatWithDoctorScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Audio Call".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.audioCallScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Video Call".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.videoCallScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Articles".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.articlesScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Pharmacy".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.pharmacyScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Drugs Detail".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.drugsDetailScreen),
                        ),
                        _buildScreenTitle(
                          userName: "My Cart".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.myCartScreen),
                        ),
                        _buildScreenTitle(
                          userName: "Location".tr,
                          onTapScreenTitle: () =>
                              onTapScreenTitle(AppRoutes.locationScreen),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppNavigation() {
    return Container(
      decoration: BoxDecoration(
        color: Color(0XFFFFFFFF),
      ),
      child: Column(
        children: [
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Text(
                "App Navigation".tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF000000),
                  fontSize: 20.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.v),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20.h),
              child: Text(
                "Check your app's UI from the below demo screens of your app."
                    .tr,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0XFF888888),
                  fontSize: 16.fSize,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.v),
          Divider(
            height: 1.v,
            thickness: 1.v,
            color: Color(0XFF000000),
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildScreenTitle({
    required String userName,
    Function? onTapScreenTitle,
  }) {
    return GestureDetector(
      onTap: () {
        onTapScreenTitle!.call();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFFFFFFF),
        ),
        child: Column(
          children: [
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Text(
                  userName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0XFF000000),
                    fontSize: 20.fSize,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.v),
            SizedBox(height: 5.v),
            Divider(
              height: 1.v,
              thickness: 1.v,
              color: Color(0XFF888888),
            ),
          ],
        ),
      ),
    );
  }

  /// Common click event
  void onTapScreenTitle(String routeName) {
    Get.toNamed(routeName);
  }
}
