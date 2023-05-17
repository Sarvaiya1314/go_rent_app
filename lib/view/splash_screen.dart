import 'package:flutter/material.dart';
import 'package:go_rent_app/view/welcome_screen.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoaded = false;

  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((value) => setState(() {
          isLoaded = true;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateWhere: isLoaded,
      navigateRoute: const WelcomeScreen(), backgroundColor: Colors.white,

      imageSrc: 'assets/image/GRLogo.png', logoSize: 300,
      //  displayLoading: false,
    );
  }
}
