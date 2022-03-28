import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/meutextform_widget.dart';
import 'package:procedimentos_durin/app/modules/auth/model/user_model.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    final usuarioEC = TextEditingController();
    final senhaEC = TextEditingController();
    // var model = UserModel(usuario: usuarioEC.text, senha: senhaEC.text);
    return Scaffold(
      backgroundColor: DuroSystemColors.vermelho,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 1),
            Image.asset(
              'assets/splash_screen_logo.png',
              color: DuroSystemColors.meioBranco,
            ),
            const SizedBox(height: 30),
            const Text(
              'Entrar na conta',
              style: TextStyle(
                color: DuroSystemColors.meioBranco,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            MeutextformWidget(
                label: 'Usuário', controller: usuarioEC, obscureText: false),
            const SizedBox(height: 15),
            MeutextformWidget(
                label: 'Senha', controller: senhaEC, obscureText: true),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                if (usuarioEC.value.text == 'Bruno' &&
                    senhaEC.value.text == '123') {
                  Modular.to.navigate('/home/');
                  // Navigator.pushNamed(context, '/home');
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
                primary: DuroSystemColors.meioBranco,
              ),
            ),
            const Spacer(flex: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Não tem uma conta?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: DuroSystemColors.meioBranco),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pushNamed('/register'),
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
    );
  }
}
