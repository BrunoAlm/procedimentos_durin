import 'package:flutter/material.dart';
import 'package:procedimentos_durin/Splash%20Page/splash_page.dart';

class MeuApp extends StatelessWidget {
  const MeuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
      },
    );
  }
}
