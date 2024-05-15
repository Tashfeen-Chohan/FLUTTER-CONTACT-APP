import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/controller/bottom_navbar_controller.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

class MyBottomNav extends StatelessWidget {
  MyBottomNav({super.key});

  final controller = Get.put(BottomNavController());

  void onItemTapped(int index) {
    controller.changeIndex(index);
    switch (index) {
      case 0:
        Get.to(() => const ContactsScreen());
        break;
      case 1:
        Get.to(() => const ProfileScreen());
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: "Settings"),
        ],
        onTap: onItemTapped,
      ),
    );
  }
}
