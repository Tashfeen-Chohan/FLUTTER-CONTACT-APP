import 'package:flutter/material.dart';

class DashboardSingleCategory extends StatelessWidget {
  const DashboardSingleCategory({
    super.key,
    required this.iconText,
    required this.title,
    required this.subTitle,
  });

  final String iconText, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 170,
      child: Row(
        children: [
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                iconText,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                Text(
                  overflow: TextOverflow.ellipsis,
                  subTitle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
