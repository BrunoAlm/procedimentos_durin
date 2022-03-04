import 'package:flutter/material.dart';
import 'package:procedimentos_durin/Home_Page/home_page.dart';
import 'package:procedimentos_durin/Splash_Page/splash_page.dart';
import 'package:procedimentos_durin/login_page/login_page.dart';
import 'package:procedimentos_durin/register_page/register_page.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      },
    );
  }
}
