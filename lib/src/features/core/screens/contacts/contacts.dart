import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/common/bottom_navbar.dart';
import 'package:login_app/src/common/side_drawer.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  @override
  Widget build(BuildContext context) {
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
      floatingActionButton: const FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
