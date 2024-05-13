import 'package:flutter/material.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';

class EditContactScreen extends StatelessWidget {
  const EditContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Edit Contact",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 60,
                  foregroundImage: AssetImage(tPhone),
                ),
                const SizedBox(height: 50),
                Form(
                  child: Column(
                    children: [
                      const TextfieldWidget(
                        label: "FULL NAME",
                        hintText: "Full Name",
                        prefixIcon: Icons.person_2_outlined,
                      ),
                      const SizedBox(height: 15),
                      const TextfieldWidget(
                        label: "PHONE NO",
                        hintText: "Contact no",
                        prefixIcon: Icons.phone_enabled_outlined,
                      ),
                      const SizedBox(height: 15),
                      const TextfieldWidget(
                        label: "RELATIONSHIP",
                        hintText: "Relationship",
                        prefixIcon: Icons.supervised_user_circle,
                      ),
                      const SizedBox(height: 30),
                      ElevatedButtonWidget(
                        text: "Edit",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Delete contact",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
