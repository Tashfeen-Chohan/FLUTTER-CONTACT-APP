import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/src/features/auth/model/user_model.dart';
import 'package:login_app/src/features/core/screens/contacts/contacts.dart';
import 'package:login_app/src/features/core/screens/profile/profile_screen.dart';
import 'package:login_app/src/features/core/screens/users/users_screen.dart';
import 'package:login_app/src/repository/auth_repository/auth_repo.dart';
import 'package:login_app/src/repository/user_repository/user_repository.dart';

class MyBottonNavbar extends StatefulWidget {
  const MyBottonNavbar({super.key});

  @override
  State<MyBottonNavbar> createState() => _MyBottonNavbarState();
}

class _MyBottonNavbarState extends State<MyBottonNavbar> {
  final controller = Get.put(UserRepository());
  final _authRepo = Get.put(AuthRepository());
  // ignore: unused_field
  bool _isLoading = true;
  UserModel? _user;

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

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });

  //   switch (index) {
  //     case 0:
  //       Get.to(() => const ContactsScreen());
  //     // break;
  //     case 1:
  //       Get.to(() => const ProfileScreen());
  //     // break;
  //     case 2:
  //       Get.to(() => const UsersScreen());
  //     // break;
  //     default:
  //   }
  // }

  List<BottomNavigationBarItem> buildBottomNavBarItems(String email) {
    List<BottomNavigationBarItem> items = [
      const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(Icons.settings), label: "Settings"),
    ];

    if (email == "chohantashfeen@gmail.com") {
      items.insert(
          2,
          const BottomNavigationBarItem(
              icon: Icon(Icons.group), label: "Users"));
    }

    return items;
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const SizedBox();
    }
    return BottomNavigationBar(
      items: buildBottomNavBarItems(_user!.email),
      onTap: (index) {
        switch (index) {
          case 0:
            Get.to(() => const ContactsScreen());
          case 1:
            Get.to(() => const ProfileScreen());
          case 2:
            Get.to(() => const UsersScreen());
          default:
        }
      },
    );
  }
}
