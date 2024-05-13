import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/bottom_navbar.dart';
import 'package:login_app/src/common/side_drawer.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/models/contact_model.dart';
import 'package:login_app/src/features/core/screens/contacts/new_contact.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';
import 'package:login_app/src/repository/contact_repository/contact_repository.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final controller = Get.put(UserRepository());
  final _authRepo = Get.put(AuthRepository());
  // ignore: unused_field
  UserModel? _user;
  bool _isLoading = true;

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
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final contactRepo = Get.put(ContactRepository());
    if (_isLoading) {
      return const SizedBox();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text(
          "CONTACTS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const ProfileScreen()),
            icon: const Icon(
              Icons.person_outline,
              size: 30,
            ),
          ),
        ],
      ),
      drawer: const SideDrawer(),
      bottomNavigationBar: const MyBottonNavbar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () => Get.to(() => const NewContactScreen()),
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              FutureBuilder<List<ContactModel>>(
                future: contactRepo.getUserContacts(_user!.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8.0,
                            crossAxisSpacing: 8.0,
                            childAspectRatio: 0.8,
                          ),
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            final data = snapshot.data![index];
                            return SingleContactWidget(data: data);
                          });
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
            ],
          ),
        ),
      ),
    );
  }
}

class SingleContactWidget extends StatelessWidget {
  const SingleContactWidget({
    super.key,
    required this.data,
  });

  final ContactModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.1),
        //     spreadRadius: 1,
        //     blurRadius: 1,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
      ),
      child: Column(
        children: [
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.2),
                borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Text(
              data.fullName[0],
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            )),
          ),
          const SizedBox(height: 10),
          Text(
            data.fullName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            data.phoneNo,
            style: const TextStyle(
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10),
          data.relationship != null
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(data.relationship!),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
