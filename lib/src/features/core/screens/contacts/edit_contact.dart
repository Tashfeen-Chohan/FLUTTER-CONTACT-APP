import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/core/models/contact_model.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/repository/contact_repository/contact_repository.dart';

class EditContactScreen extends StatefulWidget {
  const EditContactScreen({super.key, required this.contactId});

  final String contactId;

  @override
  State<EditContactScreen> createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  String? relationship;
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
              future: controller.getContactDetails(widget.contactId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ContactModel contact = snapshot.data as ContactModel;
                    fullName.text = contact.fullName;
                    phoneNo.text = contact.phoneNo;
                    relationship = contact.relationship ?? "";

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
                              // relationship.text != ""
                              //     ? TextfieldWidget(
                              //         controller: relationship,
                              //         label: "RELATIONSHIP",
                              //         hintText: "Relationship",
                              //         prefixIcon: Icons.supervised_user_circle,
                              //       )
                              //     : const SizedBox(),
                              relationship != ""
                                  ? DropdownButtonFormField<String>(
                                      value: relationship ?? "",
                                      onChanged: (String? newValue) {
                                        relationship = newValue;
                                      },
                                      items: <String>[
                                        'Family',
                                        'Friend',
                                        'Professional',
                                        'Other'
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'SELECT A RELATIONSHIP',
                                        labelText: 'RELATIONSHIP',
                                        prefixIcon:
                                            Icon(Icons.supervised_user_circle),
                                      ),
                                    )
                                  : const SizedBox(),
                              const SizedBox(height: 30),
                              ElevatedButtonWidget(
                                text: "Edit",
                                onPressed: () async {
                                  final updatedContact = ContactModel(
                                    id: widget.contactId,
                                    fullName: fullName.text.trim(),
                                    phoneNo: phoneNo.text.trim(),
                                    // ignore: unnecessary_null_in_if_null_operators
                                    relationship: relationship ?? null,
                                    // relationship:
                                    //     relationship.text.trim().isEmpty
                                    //         ? null
                                    //         : relationship.text.trim(),
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
