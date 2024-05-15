import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/core/models/contact_model.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/repository/contact_repository/contact_repository.dart';

class EditContactScreen extends StatelessWidget {
  const EditContactScreen({super.key, required this.contactId});

  final String contactId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactRepository());
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
            child: FutureBuilder(
              future: controller.getContactDetails(contactId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ContactModel contact = snapshot.data as ContactModel;
                    final fullName =
                        TextEditingController(text: contact.fullName);
                    final phoneNo =
                        TextEditingController(text: contact.phoneNo);
                    final relationship =
                        TextEditingController(text: contact.relationship);
                    return Column(
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
                              TextfieldWidget(
                                controller: fullName,
                                label: "FULL NAME",
                                hintText: "Full Name",
                                prefixIcon: Icons.person_2_outlined,
                              ),
                              const SizedBox(height: 15),
                              TextfieldWidget(
                                controller: phoneNo,
                                label: "PHONE NO",
                                hintText: "Contact no",
                                prefixIcon: Icons.phone_enabled_outlined,
                              ),
                              const SizedBox(height: 15),
                              relationship.text != ""
                                  ? TextfieldWidget(
                                      controller: relationship,
                                      label: "RELATIONSHIP",
                                      hintText: "Relationship",
                                      prefixIcon: Icons.supervised_user_circle,
                                    )
                                  : const SizedBox(),
                              const SizedBox(height: 30),
                              ElevatedButtonWidget(
                                text: "Edit",
                                onPressed: () async {
                                  final updatedContact = ContactModel(
                                    id: contactId,
                                    fullName: fullName.text.trim(),
                                    phoneNo: phoneNo.text.trim(),
                                    relationship:
                                        relationship.text.trim().isEmpty
                                            ? null
                                            : relationship.text.trim(),
                                    userId: contact.userId,
                                  );
                                  await controller
                                      .updateContact(updatedContact);
                                  Get.to(() => const ContactsScreen());
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Dont' need this contact anymore?"),
                            TextButton(
                              onPressed: () async {
                                bool? confirmed = await showDialog<bool>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Confirm Deletion'),
                                      content: const Text(
                                          'Are you sure you want to delete this contact?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(false);
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text(
                                            'Delete',
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );

                                if (confirmed == true) {
                                  controller.deleteContact(contactId);
                                  Get.to(() => const ContactsScreen());
                                }
                              },
                              child: const Text(
                                "Delete!",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        )
                        // Align(
                        //   alignment: Alignment.centerRight,
                        //   child: TextButton(
                        //     onPressed: () {},
                        //     child: TextButton(
                        //       onPressed: () async {
                        //         controller.deleteContact(contactId);
                        //         Get.to(() => const ContactsScreen());
                        //       },
                        //       child: const Text(
                        //         "Delete contact",
                        //         style: TextStyle(
                        //           color: Colors.red,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return const Text("Something went wrong!");
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
