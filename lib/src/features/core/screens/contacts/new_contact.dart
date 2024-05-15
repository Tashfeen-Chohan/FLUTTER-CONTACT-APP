import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/elevated_button_widget.dart';
import 'package:login_app/src/common/form_header_widget.dart';
import 'package:login_app/src/common/textfield_widget.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/models/contact_model.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';
import 'package:login_app/src/repository/contact_repository/contact_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class NewContactScreen extends StatefulWidget {
  const NewContactScreen({super.key});

  @override
  State<NewContactScreen> createState() => _NewContactScreenState();
}

class _NewContactScreenState extends State<NewContactScreen> {
  final controller = Get.put(UserRepository());
  final _authRepo = Get.put(AuthRepository());
  // ignore: unused_field
  late final UserModel _user;
  // String? _selectedRelationship;

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      final userData = await controller.getUserDetails(email);
      setState(() {
        _user = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactRepo = Get.put(ContactRepository());
    final fullNameController = TextEditingController();
    final phoneNoController = TextEditingController();
    final relationshipController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(height: 50),
              const FormHeaderWidget(
                headerImg: tNewContact,
                title: "Add New Contact",
                subTitle: 'Stay connected with the people who matter most.',
              ),
              Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      TextfieldWidget(
                        controller: fullNameController,
                        label: "FULL NAME *",
                        hintText: "Full Name",
                        prefixIcon: Icons.person_2,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Full Name is required!";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextfieldWidget(
                        controller: phoneNoController,
                        isNumber: true,
                        label: "PHONE NO *",
                        hintText: "Contact Number",
                        prefixIcon: Icons.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Contact number is required!";
                          } else if (value.length != 11) {
                            return "Contact number must be exactly 11 digits";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 15),
                      TextfieldWidget(
                        controller: relationshipController,
                        label: "RELATIONSHIP",
                        hintText: "Relationship",
                        prefixIcon: Icons.supervised_user_circle,
                      ),
                      // DropdownButtonFormField<String>(
                      //   value: _selectedRelationship,
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       _selectedRelationship = newValue;
                      //     });
                      //   },
                      //   items: <String>[
                      //     'Family',
                      //     'Friend',
                      //     'Professional',
                      //     'Other'
                      //   ].map<DropdownMenuItem<String>>((String value) {
                      //     return DropdownMenuItem<String>(
                      //       value: value,
                      //       child: Text(value),
                      //     );
                      //   }).toList(),
                      //   decoration: const InputDecoration(
                      //     border: OutlineInputBorder(),
                      //     hintText: 'SELECT A RELATIONSHIP',
                      //     labelText: 'RELATIONSHIP',
                      //     prefixIcon: Icon(Icons.supervised_user_circle),
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      ElevatedButtonWidget(
                        text: "SAVE",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final contact = ContactModel(
                              fullName: fullNameController.text.trim(),
                              phoneNo: phoneNoController.text.trim(),
                              relationship:
                                  relationshipController.text.trim().isEmpty
                                      ? null
                                      : relationshipController.text.trim(),
                              userId: _user.id!,
                            );
                            await contactRepo.createContact(contact);
                            fullNameController.text = "";
                            phoneNoController.text = "";
                            relationshipController.text = "";
                            Get.to(() => const ContactsScreen());
                          }
                        },
                      ),
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
