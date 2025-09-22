import 'package:flutter/material.dart';
import 'package:islami_mon_c16_online/ui/home/home_screen.dart';
import 'package:islami_mon_c16_online/ui/splash/splash_screen.dart';
import 'package:islami_mon_c16_online/ui/sura_details/sura_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetailsScreen.routeName: (_) => SuraDetailsScreen(),
      },
      initialRoute: SplashScreen.routeName,
    );
  }
}
