import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/controller/profile_controller.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    List<UserModel> users = []; // List to hold all users
    List<UserModel> filteredUsers = []; // List to hold filtered users

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "All Users",
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  setState(() {
                    filteredUsers = users
                        .where((user) => user.fullName
                            .toLowerCase()
                            .contains(value.toLowerCase()))
                        .toList();
                  });
                },
              ),
              const SizedBox(height: 20),
              FutureBuilder<List<UserModel>>(
                future: controller.getAllUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      users = snapshot.data!;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredUsers.isNotEmpty
                            ? filteredUsers.length
                            : snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final user = filteredUsers.isNotEmpty
                              ? filteredUsers[index]
                              : snapshot.data![index];
                          return Column(
                            children: [
                              ListTile(
                                tileColor: tAccentColor.withOpacity(0.1),
                                iconColor: Colors.deepPurple,
                                leading: const Icon(
                                  Icons.person_2_outlined,
                                  size: 40,
                                ),
                                title: Text(user.fullName),
                                subtitle: Text(user.email),
                              ),
                              const Divider(
                                  height: 15, color: Colors.transparent),
                            ],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else {
                      return const Center(
                        child: Text("Something went wrong"),
                      );
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
