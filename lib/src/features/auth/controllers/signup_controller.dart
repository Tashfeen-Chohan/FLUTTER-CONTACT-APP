import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final userRepository = Get.put(UserRepository());

  final fullName = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  Future<bool> registerUser(String email, String password) async {
    String? error = await AuthRepository.instance
        .createUserWithEmailAndPassword(email, password);
    if (error != null) {
      Get.snackbar("Error", error.toString());
      return false;
    } else {
      fullName.text = "";
      this.email.text = "";
      this.password.text = "";
      return true;
    }
  }

  Future<void> createUser(UserModel user) async {
    final success = await registerUser(user.email, user.password);
    if (success) {
      await userRepository.createUser(user);
    }
  }
}
