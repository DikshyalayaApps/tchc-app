import 'package:tchc/core/app_export.dart';
import 'package:tchc/presentation/doctor_detail_screen/models/doctor_detail_model.dart';

/// A controller class for the DoctorDetailScreen.
///
/// This class manages the state of the DoctorDetailScreen, including the
/// current doctorDetailModelObj
class DoctorDetailController extends GetxController {
  Rx<DoctorDetailModel> doctorDetailModelObj = DoctorDetailModel().obs;
}
