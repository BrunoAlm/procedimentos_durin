import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundLoginPage(),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.10,
            left: MediaQuery.of(context).size.width * 0.27,
            child: Image.asset(
              'assets/splash_screen_logo.png',
              color: Colors.white,
            ),
          ),

          Positioned(
            left: MediaQuery.of(context).size.width * 0.40,
            top: MediaQuery.of(context).size.height * 0.35,
            child: const Text(
              'Entrar',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: MediaQuery.of(context).size.width * 0.13,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                MeuTextFormField(label: 'Usuário'),
                SizedBox(height: 30),
                MeuTextFormField(label: 'Senha'),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            left: MediaQuery.of(context).size.width * 0.10,
            child: Row(
              children: [
                const Text(
                  'Não tem uma conta?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Cadastre-se',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.5,
          //   child: const MeuTextFormField(),
          // ),
          // Positioned(
          //   top: MediaQuery.of(context).size.height * 0.6,
          //   child: const MeuTextFormField(),
          // ),
        ],
      ),
    );
  }
}

class BackgroundLoginPage extends StatelessWidget {
  const BackgroundLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 212, 52, 40),
    );
  }
}

class MeuTextFormField extends StatelessWidget {
  const MeuTextFormField({Key? key, required this.label}) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text('    $label  '),
        fillColor: Colors.white,
        constraints: const BoxConstraints(maxWidth: 300),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
      ),
    );
  }
}
