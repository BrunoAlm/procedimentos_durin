import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),
              Center(
                child: Column(
                  children: [
                    Image.asset('assets/splash_screen_logo.png'),
                    const Text(
                      "PROCEDIMENTOS E CHAMADOS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // const Divider(thickness: 3),
              const Spacer(flex: 1),
              HomePageButtons(texto: 'Procedimentos', onPressed: () {}),
              const SizedBox(height: 15),
              HomePageButtons(texto: 'Chamados', onPressed: () {}),
              const SizedBox(height: 15),
              HomePageButtons(texto: 'Anotações', onPressed: () {}),
              const SizedBox(height: 15),
              HomePageButtons(texto: 'Gerenciar Conta', onPressed: () {}),
              const SizedBox(height: 15),
              HomePageButtons(
                texto: 'Desconectar',
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
              ),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageButtons extends StatelessWidget {
  const HomePageButtons({
    Key? key,
    required this.texto,
    required this.onPressed,
  }) : super(key: key);

  final String texto;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(
        texto,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 16,
        ),
      ),
    );
  }
}
