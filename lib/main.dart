// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login_app/firebase_options.dart';
import 'package:login_app/src/features/auth/screens/forget_password/forget_password_otp/otp_screen.dart';
import 'package:login_app/src/features/auth/screens/login/login_screen.dart';
import 'package:login_app/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';
import 'package:login_app/src/utils/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (value) => Get.put(
      AuthRepository(),
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const Center(child: CircularProgressIndicator()),
    );
  }
}

