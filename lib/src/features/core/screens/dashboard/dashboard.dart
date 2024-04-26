import 'package:flutter/material.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/categories/categories.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/dashboard_appbar.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/header.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/search_box.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/courses/top_courses.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              DashboardHeader(textTheme: textTheme),
              // SEARCH BOX
              const DashboardSearchBox(),
              const SizedBox(
                height: 30,
              ),
              // CATEGORIES
              const DashboardCategories(),
              const SizedBox(
                height: 40,
              ),
              // TOP COURSES
              const DashboardTopCourses()
            ],
          ),
        ),
      ),
    );
  }
}
