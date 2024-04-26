import 'package:flutter/material.dart';
import 'package:login_app/src/features/core/models/category_model.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/categories/single_category.dart';

class DashboardCategories extends StatelessWidget {
  const DashboardCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final list = CategoryModel.list;
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (context, index) {
          return DashboardSingleCategory(model: list[index]);
        },
      ),
    );
  }
}
