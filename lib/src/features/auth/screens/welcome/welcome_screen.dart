import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/features/auth/screens/welcome/widgets/wecome_intro_widget.dart';
import 'package:login_app/src/features/auth/screens/welcome/widgets/welcome_buttons_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              image: const AssetImage(tWelomeScreenImg),
              height: height * 0.5,
            ),
            const WelcomeIntroWidget(),
            const WelcomeButtonsWidget()
          ],
        ),
      ),
    );
  }
}
