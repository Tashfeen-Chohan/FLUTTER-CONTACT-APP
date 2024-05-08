import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/controller/profile_controller.dart';

class UpdateProfileForm extends StatelessWidget {
  const UpdateProfileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return FutureBuilder(
        future: controller.getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              UserModel userData = snapshot.data as UserModel;
              return Form(
                child: Column(
                  children: [
                    // const TextfieldWidget(
                    //   label: "Username",
                    //   hintText: "Full Name",
                    //   prefixIcon: Icons.verified_user_rounded,
                    // ),
                    TextFormField(
                      initialValue: userData.fullName,
                    ),
                    const SizedBox(height: 15),
                    const TextfieldWidget(
                      label: "Email",
                      hintText: "Email",
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 15),
                    const TextfieldWidget(
                      label: "Phone No",
                      hintText: "Phone Number",
                      prefixIcon: Icons.phone,
                    ),
                    const SizedBox(height: 15),
                    const TextfieldWidget(
                      label: "Password",
                      hintText: "********",
                      prefixIcon: Icons.fingerprint,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButtonWidget(
                      text: "Edit Profile",
                      onPressed: () {
                        Get.snackbar("Hello", "Tashfeen Chohan");
                      },
                    ),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              return const Center(
                child: Text("Something went wrong!"),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
