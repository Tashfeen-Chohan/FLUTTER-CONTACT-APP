import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/dashboard/dashboard.dart';
import 'package:login_app/src/features/core/screens/users/users_screen.dart';

class MyBottonNavbar extends StatelessWidget {
  const MyBottonNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.group), label: "Users"),
        BottomNavigationBarItem(icon: Icon(Icons.phone), label: "Contacts"),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Get.to(() => const Dashboard());
          case 1:
            Get.to(() => const UsersScreen());
          default:
        }
      },
    );
  }
}
