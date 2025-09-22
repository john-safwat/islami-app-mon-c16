import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/core/styles/app_colors.dart';
import 'package:islami_mon_c16_online/ui/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          ZoomIn(
            duration: Duration(seconds: 1),
            child: Center(
              child: Image.asset(
                "assets/images/islami_logo.png",
                width: size.width * 0.4,
              ),
            ),
          ),

          Positioned(
            bottom: 32,
            child: ZoomIn(
              child: Image.asset(
                "assets/images/branding.png",
                width: size.width * 0.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
