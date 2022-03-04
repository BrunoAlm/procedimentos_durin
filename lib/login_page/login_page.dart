import 'package:flutter/material.dart';
import 'package:procedimentos_durin/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final usuarioEC = TextEditingController();
    final senhaEC = TextEditingController();

    return Scaffold(
      body: BackgroundLoginPage(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(flex: 1),
              Image.asset(
                'assets/splash_screen_logo.png',
                color: Colors.white,
              ),
              const SizedBox(height: 30),
              const Text(
                'Entrar na conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              MeuTextFormField(
                  label: 'Usuário', controller: usuarioEC, obscureText: false),
              const SizedBox(height: 15),
              MeuTextFormField(
                  label: 'Senha', controller: senhaEC, obscureText: true),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  if (usuarioEC.value.text == 'Bruno' &&
                      senhaEC.value.text == '123') {
                    Navigator.pushNamed(context, '/home');
                  } else {
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        title: const Text('Erro'),
                        content: const Text('Usuário ou senha inválidos'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Voltar'))
                        ],
                      ),
                    );
                  }
                },
                child: const Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.white,
                ),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('/register'),
                    child: Text(
                      'Cadastre-se',
                      style: TextStyle(
                        color: Colors.blue.shade300,
                        decorationColor: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.wavy,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
