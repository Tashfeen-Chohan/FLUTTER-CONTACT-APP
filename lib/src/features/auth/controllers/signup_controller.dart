
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser (String email, String password){
    AuthRepository.instance.createUserWithEmailAndPassword(email, password);
  }

}