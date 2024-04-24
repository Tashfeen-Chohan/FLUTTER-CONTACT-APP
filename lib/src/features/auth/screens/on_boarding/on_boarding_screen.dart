import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:login_app/src/constants/colors.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/model/model_on_boarding.dart';
import 'package:login_app/src/features/auth/screens/on_boarding/on_boarding_page_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = LiquidController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final pages = [
      OnBoardingPageWidget(
        model: OnBoardingModel(
            img: tOnBoardingImg1,
            title: "Build Awesome Apps",
            subTitle:
                "Lets start your journey with us on this amazing and easy platform.",
            counterText: "1/3",
            bgColor: tOnBoardingScreen1Color,
            height: size.height),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
            img: tOnBoardingImg2,
            title: "Learn from Youtube",
            subTitle:
                "Get video tutorials of each topic to learn things easily.",
            counterText: "2/3",
            bgColor: tOnBoardingScreen2Color,
            height: size.height),
      ),
      OnBoardingPageWidget(
        model: OnBoardingModel(
            img: tOnBoardingImg3,
            title: "Get Code & Resources",
            subTitle:
                "Save time by just coping pasting complete app learn from videos.",
            counterText: "3/3",
            bgColor: tOnBoardingScreen3Color,
            height: size.height),
      ),
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: controller,
            onPageChangeCallback: onPageChangeCallBack,
            slideIconWidget: const Icon(Icons.arrow_back_ios),
            enableSideReveal: true,
          ),
          Positioned(
            top: 40,
            right: 10,
            child: TextButton(
              child: const Text(
                "Skip",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              onPressed: () => {controller.jumpToPage(page: pages.length - 1)},
            ),
          ),
          Positioned(
            bottom: 70,
            child: ElevatedButton(
              onPressed: () => controller.jumpToPage(page: currentPage + 1),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white),
              child: const Text("Next Page"),
            ),
          ),
          Positioned(
            bottom: 40,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.currentPage,
              count: pages.length,
              effect: const WormEffect(
                activeDotColor: Colors.black,
                dotHeight: 4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChangeCallBack(activePageIndex) {
    setState(() {
      currentPage = activePageIndex;
    });
  }
}
