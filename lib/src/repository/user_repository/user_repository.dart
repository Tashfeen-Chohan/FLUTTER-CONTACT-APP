import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/auth/screens/welcome/welcome_screen.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson());
  }

  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> getAllUsers() async {
    final snapshot = await _db
        .collection("Users")
        .orderBy("Timestamp", descending: true)
        .get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection("Users").doc(user.id).update(user.toJson());
  }

  Future<void> deleteUser(String userId) async {
    try {
      // Delete user from Firebase Authentication
      await FirebaseAuth.instance.currentUser?.delete();
      // Delete user's document from Firestore collection
      await _db.collection('Users').doc(userId).delete();
      Get.to(() => const WelcomeScreen());
      Get.snackbar("Success", "Record deleted successfully!");
    } catch (e) {
      Get.snackbar("Error", "Something went wrong!");
    }
  }
}
