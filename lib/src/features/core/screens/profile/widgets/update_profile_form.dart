import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

              DateTime dateTime = userData.timestamp.toDate();
              String formattedDate =
                  DateFormat('dd MMMM yyyy', 'en_US').format(dateTime);

              return Column(
                children: [
                  Form(
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
                          isEnabled: false,
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
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          style: const TextStyle(fontSize: 16),
                          children: [
                            const TextSpan(text: "Joinded"),
                            const WidgetSpan(
                                child: SizedBox(
                              width: 10,
                            )),
                            TextSpan(
                              text: formattedDate,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.deleteRecord(userData);
                        },
                        child: const Text(
                          "Delete",
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
