import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/controller/profile_controller.dart';
import 'package:login_app/src/features/core/screens/profile/update_profile.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProfileController());
    return Column(
      children: [
        Stack(
          children: [
            const CircleAvatar(
              radius: 70,
              foregroundImage: AssetImage(tProfile),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.mode_edit_outline_outlined,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel userData = snapshot.data as UserModel;
                  return Column(
                    children: [
                      Text(
                        userData.fullName,
                        style: textTheme.headlineMedium,
                      ),
                      Text(
                        userData.email,
                        style: textTheme.bodyMedium,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButtonWidget(
                        text: "Edit Profile",
                        width: 150,
                        onPressed: () => Get.to(() => const UpdateProfile()),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: CircularProgressIndicator(),
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
            }),
        const SizedBox(
          height: 10,
        ),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}
