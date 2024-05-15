import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

class SimpleBottomNavbar extends StatefulWidget {
  const SimpleBottomNavbar({super.key});

  @override
  State<SimpleBottomNavbar> createState() => _SimpleBottomNavbarState();
}

class _SimpleBottomNavbarState extends State<SimpleBottomNavbar> {
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
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
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      selectedItemColor: Colors.blue,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ],
      onTap: _onItemTapped,
      // onTap: (index) {
      //   switch (index) {
      //     case 0:
      //       Get.to(() => const ContactsScreen());
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     case 1:
      //       Get.to(() => const ProfileScreen());
      //       setState(() {
      //         _currentIndex = index;
      //       });
      //     default:
      //   }
      // },
    );
  }
}
