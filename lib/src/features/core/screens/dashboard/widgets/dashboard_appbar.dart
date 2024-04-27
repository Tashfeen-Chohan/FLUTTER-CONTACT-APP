import 'package:flutter/material.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';

class DashboardAppbar extends StatelessWidget implements PreferredSize {
  const DashboardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu),
      title: const Text(
        "Dashboard",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: _handleLogout,
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

  void _handleLogout() {
    AuthRepository.instance.signOut();
  }
}
