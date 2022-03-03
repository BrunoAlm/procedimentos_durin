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
              const HomePageButtons(texto: 'Procedimentos'),
              const SizedBox(height: 15),
              const HomePageButtons(texto: 'Chamados'),
              const SizedBox(height: 15),
              const HomePageButtons(texto: 'Anotações'),
              const SizedBox(height: 15),
              const HomePageButtons(texto: 'Gerenciar Conta'),
              const SizedBox(height: 15),
              const HomePageButtons(texto: 'Desconectar'),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageButtons extends StatelessWidget {
  const HomePageButtons({Key? key, required this.texto}) : super(key: key);
  final String texto;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.red,
        padding: const EdgeInsets.symmetric(vertical: 15),
      ),
      onPressed: () {},
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
