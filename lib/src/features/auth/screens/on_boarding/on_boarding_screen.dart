import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/model_on_boarding.dart';
import 'package:login_app/src/features/auth/screens/on_boarding/on_boarding_page_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
            img: tOnBoardingImg1,
            title: "Build Awesome Apps",
            subTitle:
                "Lets start your journey with us on this amazing and easy platform",
            counterText: "1/3",
            bgColor: tOnBoardingScreen1Color,
            height: size.height),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
            img: tOnBoardingImg1,
            title: "Build Awesome Apps",
            subTitle:
                "Lets start your journey with us on this amazing and easy platform",
            counterText: "2/3",
            bgColor: tOnBoardingScreen2Color,
            height: size.height),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
            img: tOnBoardingImg1,
            title: "Build Awesome Apps",
            subTitle:
                "Lets start your journey with us on this amazing and easy platform",
            counterText: "3/3",
            bgColor: tOnBoardingScreen3Color,
            height: size.height),
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
          )
        ],
      ),
    );
  }
}
