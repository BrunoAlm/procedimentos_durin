import 'package:animated_splash/animated_splash.dart';
import 'package:flutter/material.dart';
import 'package:procedimentos_durin/Home_Page/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplash(
      imagePath: 'assets/flutter_icon.png',
      home: const HomePage(),
      duration: 2500,
      type: AnimatedSplashType.StaticDuration,
    );
  }
}
