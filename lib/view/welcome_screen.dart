import 'package:action_slider/action_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 500,
            child: Stack(
              children: [
                Positioned(
                  right: 70,
                  child: SizedBox(
                    height: 500,
                    width: 500,
                    child: Image.asset(
                      'assets/image/WelPhoto.png',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 108,
            width: double.infinity,
            color: Colors.white10,
            child: Column(
              children: [
                const Text(
                  'Welcome to',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'MAK',
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Go Rental' '',
                    style: TextStyle(
                      fontFamily: 'MAK',
                      color: Color(0xFF2CB67D),
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Car Rental App',
                        style: TextStyle(
                          fontFamily: 'MAK',
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ActionSlider.standard(
            sliderBehavior: SliderBehavior.stretch,
            width: 300.0,
            backgroundColor: Colors.white,
            toggleColor: const Color(0xFF353392),
            action: (controller) async {
              controller.loading(); //starts loading animation
              await Future.delayed(const Duration(seconds: 2));
              controller.success(); //starts success animation
              await Future.delayed(
                const Duration(seconds: 1),
                () {
                  Navigator.pushReplacement(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
              );

              controller.reset(); //resets the slider
            },
            child: const Text(
              'Slide to Sign in',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'MAK',
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
