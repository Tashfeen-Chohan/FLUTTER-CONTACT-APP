import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    super.key,
    required this.headerImg,
    required this.title,
    required this.subTitle,
    this.imgHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final String headerImg, title, subTitle;
  final double? imgHeight;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image: AssetImage(headerImg),
          height: size * imgHeight!,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
