import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3)).then((_) {
      Modular.to.navigate('/auth/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: DuroSystemColors.vermelho,
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                'assets/splash_screen_logo.png',
                height: 150,
                color: DuroSystemColors.meioBranco,
              ),
              const Spacer(),
              SizedBox(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                          color: DuroSystemColors.meioBranco, strokeWidth: 3),
                    ),
                    SizedBox(width: 10),
                    Text('Carregando...'),
                  ],
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ));
  }
}
