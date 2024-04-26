import 'package:flutter/material.dart';
import 'package:login_app/src/features/core/models/course_model.dart';
import 'package:login_app/src/features/core/screens/dashboard/widgets/courses/single_top_course.dart';

class DashboardTopCourses extends StatelessWidget {
  const DashboardTopCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final list = CourseModel.list;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Top Courses",
          style: textTheme.headlineSmall,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return DashboardSingleTopCourse(model: list[index]);
            },
          ),
        ),
      ],
    );
  }
}
