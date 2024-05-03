import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    String? error = await AuthRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.snackbar("Error", error.toString());
    }
  }

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuthentication(phoneNo);
  }
}
