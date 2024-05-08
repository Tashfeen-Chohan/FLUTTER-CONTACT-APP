import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  Future<void> registerUser(String email, String password) async {
    String? error = await AuthRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.snackbar(
        "Error",
        error.toString(),
      );
    }
  }

  Future<void> createUser(UserModel user) async {
    await userRepository.createUser(user);
    await registerUser(user.email, user.password);
  }

  void phoneAuthentication(String phoneNo) {
    AuthRepository.instance.phoneAuthentication(phoneNo);
  }
}
