import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class OtpController extends GetxController {
  static OtpController get instance => Get.find();

  void verifyOtp(String otp) async {
    var isVerified = await AuthRepository.instance.verifyOtp(otp);
    isVerified ? Get.offAll(const Dashboard()) : Get.back();
  }
}
