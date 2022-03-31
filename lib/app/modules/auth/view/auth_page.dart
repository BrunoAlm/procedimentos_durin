import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/auth_store.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meuErroDialog.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meutextform_widget.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthController _authController = Modular.get();

  @override
  void initState() {
    _authController.getUsers();

    super.initState();
  }

  bool visible = true;
  bool logou = false;

  @override
  Widget build(BuildContext context) {
    final nomeEC = TextEditingController();
    final senhaEC = TextEditingController();
    final _formKey = GlobalKey<FormState>();
    // var model = UserModel(usuario: usuarioEC.text, senha: senhaEC.text);
    return Scaffold(
      backgroundColor: DuroSystemColors.vermelho,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
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
                label: 'Usuário',
                controller: nomeEC,
                onChanged: _authController.setName,
                obscureText: false,
                validator: (value) =>
                    value!.isEmpty ? 'Preencha o campo' : null,
              ),
              const SizedBox(height: 15),
              MeutextformWidget(
                label: 'Senha',
                controller: senhaEC,
                onChanged: _authController.setSenha,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'Preencha o campo' : null,
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () async {
                    // ignore: unused_local_variable
                    String? nomeEncontrado, senhaEncontrada;
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      visible = false;
                    });
                    await _authController.getUsers();
                    setState(() {
                      visible = true;
                    });

                    if (_authController.listUsers.isNotEmpty) {
                      for (var item in _authController.listUsers) {
                        // print('Nome: ${item.nome}');
                        // print('Senha: ${item.senha}');
                        // print('Setor: ${item.setor}');
                        // print('\n');
                        if (item.nome == nomeEC.value.text &&
                            item.senha == senhaEC.value.text) {
                          nomeEncontrado = item.nome;
                          senhaEncontrada = item.senha;
                          setState(() {
                            logou = true;
                          });
                        }
                      }

                      if (logou) {
                        // print(
                        //     ' $nomeEncontrado, logado com a senha $senhaEncontrada');
                        Modular.to.navigate('./home');
                      } else {
                        meuErroDialog(context);
                        // showDialog(
                        //   context: context,
                        //   builder: (_) => AlertDialog(
                        //     title: const Text('Erro'),
                        //     content: const Text('Usuário ou senha inválidos'),
                        //     actions: [
                        //       TextButton(
                        //           onPressed: () {
                        //             Navigator.pop(context);
                        //           },
                        //           child: const Text('Voltar'))
                        //     ],
                        //   ),
                        // );
                      }
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
                              child: const Text(
                                'Voltar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  }
                },
                child: visible
                    ? const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      )
                    : Container(
                        height: 16,
                        width: 16,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 2),
                        child: const CircularProgressIndicator(
                          color: DuroSystemColors.vermelho,
                        )),
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
                    onPressed: () => Modular.to.navigate('./register'),
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
