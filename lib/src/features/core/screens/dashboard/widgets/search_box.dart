import 'package:flutter/material.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        border: const Border(
          left: BorderSide(width: 4),
        ),
        // borderRadius: BorderRadius.circular(5),
        color: Colors.grey.shade200,
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Search"),
          Icon(Icons.mic),
        ],
      ),
    );
  }
}
