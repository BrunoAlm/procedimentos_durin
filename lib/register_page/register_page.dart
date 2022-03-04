import 'package:flutter/material.dart';
import 'package:procedimentos_durin/widgets/widgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    final usuarioEC = TextEditingController();
    final senhaEC = TextEditingController();
    final setorEC = TextEditingController();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 52, 40),
          elevation: 0),
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
                'Cadastrar conta',
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
              const SizedBox(height: 15),
              MeuTextFormField(
                  label: 'Setor', controller: setorEC, obscureText: false),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Cadastrado'),
                      content: ConstrainedBox(
                        constraints: const BoxConstraints(maxHeight: 80),
                        child: Column(
                          children: [
                            Text(
                              '${usuarioEC.text}, sua conta foi cadastrada com sucesso!',
                            ),
                            Text(
                              'Seu acesso está de acordo com o setor ${setorEC.text}',
                            ),
                          ],
                        ),
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Voltar'))
                      ],
                    ),
                  );
                },
                child: const Text(
                  'Cadastrar',
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
            ],
          ),
        ),
      ),
    );
  }
}
