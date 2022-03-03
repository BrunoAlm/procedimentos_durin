import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:procedimentos_durin/login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/splash_screen_logo.png'),
      logoSize: 150,
      title: const Text(
        "PROCEDIMENTOS E CHAMADOS",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      showLoader: true,
      loadingText: const Text("Carregando..."),
      navigator: const LoginPage(),
      durationInSeconds: 4,
    );
  }
}
