import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/form_header_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';

class NewContactScreen extends StatelessWidget {
  const NewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("New Contact"),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const FormHeaderWidget(
                headerImg: tNewContact,
                title: "Add New Contact",
                subTitle: 'Stay connected with the people who matter most.',
              ),
              Form(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    children: [
                      TextfieldWidget(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter Full Name here!";
                          }
                          return null;
                        },
                        // controller: loginController.email,
                        label: "FULL NAME *",
                        hintText: "Full Name",
                        prefixIcon: Icons.person_2,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const TextfieldWidget(
                        // controller: loginController.password,
                        label: "PHONE NO *",
                        hintText: "Contact Number",
                        prefixIcon: Icons.phone,
                      ),
                      const SizedBox(height: 15),
                      const TextfieldWidget(
                        label: "EMAIL",
                        hintText: "Email",
                        prefixIcon: Icons.email,
                      ),
                      const SizedBox(height: 15),
                      const TextfieldWidget(
                        label: "RELATIONSHIP",
                        hintText: "Relationship",
                        prefixIcon: Icons.supervised_user_circle,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButtonWidget(
                          text: "SAVE",
                          onPressed: () {
                            Get.snackbar(
                                "Info", "This feature is under development");
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
