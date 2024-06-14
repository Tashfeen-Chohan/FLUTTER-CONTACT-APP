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

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text(
          "All Users",
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
      ),
      // bottomNavigationBar: const MyBottonNavbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              FutureBuilder<List<UserModel>>(
                future: controller.getAllUsers(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return Dismissible(
                              key: Key(snapshot.data![index].email),
                              direction: DismissDirection.endToStart,
                              background: Container(
                                alignment: Alignment.centerRight,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                margin: const EdgeInsets.only(bottom: 15),
                                child: const Icon(Icons.delete,
                                    color: Colors.white),
                              ),
                              confirmDismiss:
                                  (DismissDirection direction) async {
                                return await showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Confirm Deletion"),
                                      content: const Text(
                                          "Are you sure you want to delete this item?"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(false),
                                          child: const Text("Cancel"),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            controller.deleteOtherUserAccount(
                                                snapshot.data![index]);
                                            Navigator.of(context).pop(true);
                                          },
                                          child: const Text(
                                            "Delete",
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              onDismissed: (DismissDirection direction) {
                                // controller.deleteOtherUserAccount(
                                //     snapshot.data![index]);
                              },
                              child: Column(
                                children: [
                                  Material(
                                    elevation: 5,
                                    borderRadius: BorderRadius.circular(10),
                                    child: ListTile(
                                      tileColor: tAccentColor.withOpacity(0.1),
                                      iconColor: Colors.deepPurple,
                                      leading: const Icon(
                                        Icons.person_2_outlined,
                                        size: 40,
                                      ),
                                      title: Text(
                                        snapshot.data![index].fullName,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle:
                                          Text(snapshot.data![index].email),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const Divider(
                                      height: 15, color: Colors.transparent),
                                ],
                              ));
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
