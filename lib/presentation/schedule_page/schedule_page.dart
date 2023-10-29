import '../schedule_page/widgets/schedulelist_item_widget.dart';
import 'controller/schedule_controller.dart';
import 'models/schedule_model.dart';
import 'models/schedulelist_item_model.dart';
import 'package:flutter/material.dart';
import 'package:tchc/core/app_export.dart';

class SchedulePage extends StatelessWidget {
  SchedulePage({Key? key})
      : super(
          key: key,
        );

  ScheduleController controller =
      Get.put(ScheduleController(ScheduleModel().obs));

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.white,
          child: Column(
            children: [
              SizedBox(height: 32.v),
              _buildScheduleList(),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildScheduleList() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.h),
        child: Obx(
          () => ListView.separated(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            separatorBuilder: (
              context,
              index,
            ) {
              return SizedBox(
                height: 16.v,
              );
            },
            itemCount: controller
                .scheduleModelObj.value.schedulelistItemList.value.length,
            itemBuilder: (context, index) {
              SchedulelistItemModel model = controller
                  .scheduleModelObj.value.schedulelistItemList.value[index];
              return SchedulelistItemWidget(
                model,
              );
            },
          ),
        ),
      ),
    );
  }
}
