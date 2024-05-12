// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/auth/screens/welcome/welcome_screen.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login_app/src/repository/auth_repository/exceptions/login_failure.dart';
import 'package:login_app/src/repository/auth_repository/exceptions/signup_email_password_failure.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const ContactsScreen());
  }

  Future<String?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // final userRepo = Get.put(UserRepository());
      // await userRepo.getUserDetails(email);
      Get.snackbar("Success", "Signup Successfully");
      firebaseUser.value != null
          ? Get.offAll(() => const Dashboard())
          : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      final ex = SignUpWithEmailAndPasswordFailure();
      print("User Error : $_");
      return ex.message;
    }
    return null;
  }

  Future<String?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("Success", "Login Successfully");
    } on FirebaseAuthException catch (e) {
      final ex = LoginFailure.fromCode(e.code);
      print("Login Code : ${e.code}");
      return ex.message;
    } catch (_) {
      final ex = LoginFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> deleteUserAccount() async {
    // Get the current user
    User? currentUser = _auth.currentUser;
    // Delete the user account
    if (currentUser != null) {
      await currentUser.delete();
      await _auth.signOut();
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Get.snackbar("Success", "Logout Successfully");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong!");
    }
  }
}
