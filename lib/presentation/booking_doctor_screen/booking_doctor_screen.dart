import 'controller/booking_doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:tchc/core/app_export.dart';
import 'package:tchc/widgets/app_bar/appbar_leading_image.dart';
import 'package:tchc/widgets/app_bar/appbar_subtitle_one.dart';
import 'package:tchc/widgets/app_bar/custom_app_bar.dart';
import 'package:tchc/widgets/custom_elevated_button.dart';
import 'package:tchc/widgets/custom_icon_button.dart';
import 'package:tchc/widgets/custom_text_form_field.dart';

class BookingDoctorScreen extends GetWidget<BookingDoctorController> {
  const BookingDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: _buildAppBar(),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 28.v),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4.v),
                      _buildDoctorInformation(),
                      SizedBox(height: 38.v),
                      _buildDate1(),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 17.v),
                      _buildReason1(),
                      SizedBox(height: 15.v),
                      Divider(),
                      SizedBox(height: 19.v),
                      _buildPaymentDetail(),
                      SizedBox(height: 13.v),
                      Divider(endIndent: 8.h),
                      SizedBox(height: 20.v),
                      _buildPaymentMethod()
                    ])),
            bottomNavigationBar: _buildCheckout()));
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
        title: AppbarSubtitleOne(text: "lbl_appointment".tr));
  }

  /// Section Widget
  Widget _buildDoctorInformation() {
    return Padding(
        padding: EdgeInsets.only(right: 41.h),
        child: Row(children: [
          CustomImageView(
              imagePath: ImageConstant.imgRectangle959,
              height: 111.adaptSize,
              width: 111.adaptSize,
              radius: BorderRadius.circular(8.h)),
          Padding(
              padding: EdgeInsets.only(left: 16.h, top: 7.v, bottom: 5.v),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("msg_dr_marcus_horizon".tr,
                        style: theme.textTheme.titleMedium),
                    SizedBox(height: 8.v),
                    Text("lbl_chardiologist".tr,
                        style: theme.textTheme.labelLarge),
                    SizedBox(height: 8.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgStar,
                          height: 16.adaptSize,
                          width: 16.adaptSize),
                      Padding(
                          padding: EdgeInsets.only(left: 4.h),
                          child: Text("lbl_4_7".tr,
                              style: CustomTextStyles.labelLargeAmber500))
                    ]),
                    SizedBox(height: 11.v),
                    Row(children: [
                      CustomImageView(
                          imagePath: ImageConstant.imgLocation,
                          height: 13.adaptSize,
                          width: 13.adaptSize,
                          margin: EdgeInsets.only(bottom: 2.v)),
                      Padding(
                          padding: EdgeInsets.only(left: 3.h),
                          child: Text("lbl_800m_away".tr,
                              style: theme.textTheme.labelLarge))
                    ])
                  ]))
        ]));
  }

  /// Section Widget
  Widget _buildDate1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 1.h),
          child:
              _buildAdminFee(adminFee: "lbl_date".tr, price: "lbl_change".tr)),
      SizedBox(height: 7.v),
      Padding(
          padding: EdgeInsets.only(right: 42.h),
          child: Row(children: [
            CustomIconButton(
                height: 36.adaptSize,
                width: 36.adaptSize,
                padding: EdgeInsets.all(8.h),
                decoration: IconButtonStyleHelper.fillOnErrorContainerTL18,
                child: CustomImageView(imagePath: ImageConstant.imgCalendar)),
            Padding(
                padding: EdgeInsets.only(left: 15.h, top: 12.v, bottom: 6.v),
                child: Text("msg_wednesday_jun_23".tr,
                    style: CustomTextStyles.titleSmallBluegray700))
          ]))
    ]);
  }

  /// Section Widget
  Widget _buildReason1() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _buildCard(actionName: "lbl_reason".tr, actionLabel: "lbl_change".tr),
      SizedBox(height: 7.v),
      CustomTextFormField(
          width: 122.h,
          controller: controller.shareController,
          hintText: "lbl_chest_pain".tr,
          hintStyle: theme.textTheme.titleSmall!,
          textInputAction: TextInputAction.done,
          prefix: Container(
              padding: EdgeInsets.all(8.h),
              margin: EdgeInsets.only(right: 15.h),
              decoration: BoxDecoration(
                  color: theme.colorScheme.onErrorContainer,
                  borderRadius: BorderRadius.circular(18.h)),
              child: CustomImageView(
                  imagePath: ImageConstant.imgShare,
                  height: 20.adaptSize,
                  width: 20.adaptSize)),
          prefixConstraints: BoxConstraints(maxHeight: 36.v),
          contentPadding: EdgeInsets.symmetric(vertical: 6.v))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentDetail() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("lbl_payment_detail".tr, style: CustomTextStyles.titleMedium16),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child:
              _buildTotal(total: "lbl_consultation".tr, price: "lbl_60_00".tr)),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildAdminFee(
              adminFee: "lbl_admin_fee".tr, price: "lbl_01_00".tr)),
      SizedBox(height: 11.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildAdminFee(
              adminFee: "msg_aditional_discount".tr, price: "lbl".tr)),
      SizedBox(height: 12.v),
      Padding(
          padding: EdgeInsets.only(right: 1.h),
          child: _buildTotal(total: "lbl_total".tr, price: "lbl_61_00".tr))
    ]);
  }

  /// Section Widget
  Widget _buildPaymentMethod() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
          padding: EdgeInsets.only(left: 2.h),
          child: Text("lbl_payment_method".tr,
              style: CustomTextStyles.titleMedium16)),
      SizedBox(height: 10.v),
      _buildCard(actionName: "lbl_visa".tr, actionLabel: "lbl_change".tr)
    ]);
  }

  /// Section Widget
  Widget _buildCheckout() {
    return Padding(
        padding: EdgeInsets.only(left: 20.h, right: 24.h, bottom: 26.v),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
              padding: EdgeInsets.only(top: 5.v, bottom: 2.v),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("lbl_total".tr,
                        style: CustomTextStyles.titleSmallGray500),
                    Padding(
                        padding: EdgeInsets.only(top: 3.v),
                        child: Text("lbl_61_002".tr,
                            style: theme.textTheme.titleMedium))
                  ])),
          CustomElevatedButton(
              height: 50.v,
              width: 192.h,
              text: "lbl_checkout".tr,
              buttonTextStyle: CustomTextStyles.titleSmallWhiteA700_1,
              onPressed: () {
                onTapCheckout();
              })
        ]));
  }

  /// Common widget
  Widget _buildAdminFee({
    required String adminFee,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(adminFee,
          style: CustomTextStyles.bodyMediumGray500
              .copyWith(color: appTheme.gray500)),
      Text(price,
          style: CustomTextStyles.bodyMediumOnPrimary
              .copyWith(color: theme.colorScheme.onPrimary))
    ]);
  }

  /// Common widget
  Widget _buildTotal({
    required String total,
    required String price,
  }) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(total,
          style: theme.textTheme.titleSmall!
              .copyWith(color: theme.colorScheme.onPrimary)),
      Text(price,
          style: CustomTextStyles.titleSmallPrimary_1
              .copyWith(color: theme.colorScheme.primary))
    ]);
  }

  /// Common widget
  Widget _buildCard({
    required String actionName,
    required String actionLabel,
  }) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.h, vertical: 13.v),
        decoration: AppDecoration.outlineGray300
            .copyWith(borderRadius: BorderRadiusStyle.roundedBorder11),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 6.h),
                  child: Text(actionName,
                      style: CustomTextStyles.titleMediumInterPrimaryContainer
                          .copyWith(
                              color: theme.colorScheme.primaryContainer))),
              Padding(
                  padding: EdgeInsets.only(top: 4.v),
                  child: Text(actionLabel,
                      style: CustomTextStyles.labelLargePrimary_1
                          .copyWith(color: theme.colorScheme.primary)))
            ]));
  }

  /// Navigates to the previous screen.
  onTapArrowLeft() {
    Get.back();
  }

  /// Navigates to the chatWithDoctorScreen when the action is triggered.
  onTapCheckout() {
    Get.toNamed(
      AppRoutes.chatWithDoctorScreen,
    );
  }
}
