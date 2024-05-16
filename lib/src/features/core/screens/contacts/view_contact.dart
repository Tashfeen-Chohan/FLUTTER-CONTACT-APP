import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/features/core/models/contact_model.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/contacts/edit_contact.dart';
import 'package:login_app/src/repository/contact_repository/contact_repository.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewContactScreen extends StatelessWidget {
  const ViewContactScreen({
    super.key,
    required this.contactId,
  });

  final String contactId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ContactRepository());
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: FutureBuilder(
              future: controller.getContactDetails(contactId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    ContactModel contact = snapshot.data as ContactModel;
                    return Column(
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                              child: Text(
                            contact.fullName[0],
                            style: const TextStyle(
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

                        const SizedBox(height: 20),
                        // PHONE & SMS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final formatNumber =
                                    "+92${contact.phoneNo.substring(1)}";
                                final Uri url =
                                    Uri(scheme: "tel", path: formatNumber);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(
                                      Icons.phone,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Call",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () async {
                                final formatNumber =
                                    "+92${contact.phoneNo.substring(1)}";
                                final Uri url =
                                    Uri(scheme: "sms", path: formatNumber);
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.blue.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(
                                      Icons.message,
                                      color: Colors.blue,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  const Text(
                                    "Text",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        ContactDetailsWidget(
                          icon: Icons.person_2_outlined,
                          title: contact.fullName,
                        ),
                        const SizedBox(height: 15),
                        ContactDetailsWidget(
                          icon: Icons.phone_enabled_outlined,
                          title: contact.phoneNo,
                        ),
                        const SizedBox(height: 15),
                        contact.relationship != null &&
                                contact.relationship != ""
                            ? ContactDetailsWidget(
                                icon: Icons.supervised_user_circle_outlined,
                                title: contact.relationship!,
                              )
                            : const SizedBox(),
                        const SizedBox(height: 20),
                        ElevatedButtonWidget(
                          text: "Edit Contact",
                          onPressed: () {
                            Get.to(
                              () => EditContactScreen(
                                contactId: contactId,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 10),
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
