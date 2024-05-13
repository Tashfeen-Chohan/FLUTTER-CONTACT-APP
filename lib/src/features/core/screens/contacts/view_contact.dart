import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/features/core/screens/contacts/edit_contact.dart';

class ViewContactScreen extends StatelessWidget {
  const ViewContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CONTACT",
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
                // CONTACT DETAILS HEADER
                Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100)),
                  child: const Center(
                      child: Text(
                    "T",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                    ),
                  )),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Contact Details",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Text("Keep in touch"),

                // CONTACT DETAILS DATA

                const SizedBox(height: 30),
                const ContactDetailsWidget(
                  icon: Icons.person_2_outlined,
                  title: "Tashfeen Chohan",
                ),
                const SizedBox(height: 15),
                const ContactDetailsWidget(
                  icon: Icons.phone_enabled_outlined,
                  title: "03096946914",
                ),
                const SizedBox(height: 15),
                const ContactDetailsWidget(
                  icon: Icons.supervised_user_circle_outlined,
                  title: "Family",
                ),
                const SizedBox(height: 30),
                ElevatedButtonWidget(
                  text: "Edit Contact",
                  onPressed: () {
                    Get.to(() => const EditContactScreen());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContactDetailsWidget extends StatelessWidget {
  const ContactDetailsWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 30,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
