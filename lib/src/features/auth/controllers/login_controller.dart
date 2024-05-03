import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  Future<void> loginUser(String email, String password) async {
    await AuthRepository.instance.signInWithEmailAndPassword(email, password);
  }
}
