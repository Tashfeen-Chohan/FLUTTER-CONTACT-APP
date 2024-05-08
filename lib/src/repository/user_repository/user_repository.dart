import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(
          () => Get.snackbar(
            "Success",
            "Your account has been created!",
          ),
        );
    // ignore: body_might_complete_normally_catch_error
    //     .catchError((error, stackStrace) {
    //   Get.snackbar(
    //     "Error",
    //     "Something went wrong. Try again!",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.red.withOpacity(0.1),
    //     colorText: Colors.red,
    //   );
    //   // ignore: avoid_print
    //   print(error.toString());
    // });
  }
}
