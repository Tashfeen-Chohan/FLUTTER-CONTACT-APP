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

              // Controllers
              final fullName = TextEditingController(text: userData.fullName);
              final email = TextEditingController(text: userData.email);
              final password = TextEditingController(text: userData.password);

              return Form(
                child: Column(
                  children: [
                    TextfieldWidget(
                      controller: fullName,
                      label: "Username",
                      hintText: "Full Name",
                      prefixIcon: Icons.verified_user_rounded,
                    ),
                    const SizedBox(height: 15),
                    TextfieldWidget(
                      controller: email,
                      label: "Email",
                      hintText: "Email",
                      prefixIcon: Icons.email,
                    ),
                    const SizedBox(height: 15),
                    TextfieldWidget(
                      isPassword: true,
                      controller: password,
                      label: "Password",
                      hintText: "********",
                      prefixIcon: Icons.fingerprint,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButtonWidget(
                      text: "Edit Profile",
                      onPressed: () async {
                        final updatedData = UserModel(
                          id: userData.id,
                          fullName: fullName.text.trim(),
                          email: email.text.trim(),
                          password: password.text.trim(),
                          timestamp: userData.timestamp,
                        );
                        await controller.updateRecord(updatedData);
                        Get.snackbar("Sucess", "Record updated successfully!");
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
