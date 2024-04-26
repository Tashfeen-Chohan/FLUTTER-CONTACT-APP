import 'package:flutter/material.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/categories/single_category.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: const [
          DashboardSingleCategory(
            iconText: "JS",
            title: "Javascript",
            subTitle: "10 Lessions",
          ),
          DashboardSingleCategory(
            iconText: "Py",
            title: "Python",
            subTitle: "3 Lessions",
          ),
          DashboardSingleCategory(
            iconText: "C++",
            title: "C++ Programming Language",
            subTitle: "5 Lessions",
          ),
          DashboardSingleCategory(
            iconText: "C#",
            title: "C Sharp",
            subTitle: "6 Lessions",
          ),
          DashboardSingleCategory(
            iconText: "J",
            title: "Java",
            subTitle: "5 Lessions",
          ),
        ],
      ),
    );
  }
}
