import '../controller/articles_controller.dart';
import '../models/sixtyfour_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tchc/core/app_export.dart';

// ignore: must_be_immutable
class SixtyfourItemWidget extends StatelessWidget {
  SixtyfourItemWidget(
    this.sixtyfourItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SixtyfourItemModel sixtyfourItemModelObj;

  var controller = Get.find<ArticlesController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.h),
      decoration: AppDecoration.outlineGray3001.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => CustomImageView(
              imagePath: sixtyfourItemModelObj.image!.value,
              height: 59.adaptSize,
              width: 59.adaptSize,
              radius: BorderRadius.circular(
                8.h,
              ),
              margin: EdgeInsets.only(bottom: 1.v),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 7.v,
              bottom: 1.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 206.h,
                  child: Obx(
                    () => Text(
                      sixtyfourItemModelObj.theHealthiest!.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: CustomTextStyles.labelLargeOnPrimary.copyWith(
                        height: 1.50,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 2.v),
                Row(
                  children: [
                    Obx(
                      () => Text(
                        sixtyfourItemModelObj.jun!.value,
                        style: theme.textTheme.labelMedium,
                      ),
                    ),
                    Container(
                      height: 2.adaptSize,
                      width: 2.adaptSize,
                      margin: EdgeInsets.only(
                        left: 2.h,
                        top: 3.v,
                        bottom: 7.v,
                      ),
                      decoration: BoxDecoration(
                        color: appTheme.gray500,
                        borderRadius: BorderRadius.circular(
                          1.h,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 4.h),
                      child: Obx(
                        () => Text(
                          sixtyfourItemModelObj.time!.value,
                          style: CustomTextStyles.labelMediumPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Obx(
            () => CustomImageView(
              imagePath: sixtyfourItemModelObj.image1!.value,
              height: 12.v,
              width: 10.h,
              margin: EdgeInsets.only(
                left: 27.h,
                top: 8.v,
                bottom: 39.v,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
