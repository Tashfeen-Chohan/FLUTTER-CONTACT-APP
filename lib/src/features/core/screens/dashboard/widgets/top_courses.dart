import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';

class DashboardTopCourses extends StatelessWidget {
  const DashboardTopCourses({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
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
          width: MediaQuery.of(context).size.width * 0.9,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                        flex: 2,
                        child: Text(
                          "Flutter Crash Course",
                          style: textTheme.headlineSmall,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    const Flexible(
                      child: Image(
                        image: AssetImage(tLogo),
                        height: 60,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "3 Sections",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Programming Languages",
                          style: textTheme.bodySmall,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
