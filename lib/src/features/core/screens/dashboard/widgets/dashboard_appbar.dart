// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSize {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Dashboard",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _navigateToProfile,
          icon: const Icon(
            Icons.person_outline,
            size: 30,
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(50);

  void _navigateToProfile() {
    Get.to(() => const ProfileScreen());
  }

  // void _handleLogout() {
  //   AuthRepository.instance.signOut();
  // }
}
