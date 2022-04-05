import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/auth_store.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/validators.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meutextform_widget.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:validatorless/validatorless.dart';

class AuthPage extends StatefulWidget {
  final String title;
  const AuthPage({Key? key, this.title = 'AuthPage'}) : super(key: key);
  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final AuthController _authController = Modular.get();
  final nomeEC = TextEditingController();
  final senhaEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nomeEC.dispose();
    senhaEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _authController.getUsers();
    super.initState();
  }

  bool visible = true;
  bool logou = false;

  @override
  Widget build(BuildContext context) {
    // var model = UserModel(usuario: usuarioEC.text, senha: senhaEC.text);
    return Scaffold(
      backgroundColor: DuroSystemColors.meioBranco,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Image.asset(
                'assets/splash_screen_logo.png',
                color: DuroSystemColors.vermelho,
              ),
              const SizedBox(height: 30),
              const Text(
                'Entrar na conta',
                style: TextStyle(
                  color: DuroSystemColors.vermelho,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              MeutextformWidget(
                label: 'Usuário',
                controller: nomeEC,
                onChanged: _authController.setName,
                validator: Validatorless.multiple([
                  Validatorless.required('Usuário requerido'),
                  Validatorless.min(8, 'Mínimo: 8 caracteres'),
                  Validatorless.max(20, 'Máximo: 20 caracteres'),
                  Validators.contemEspaco('Não pode ter espaço'),
                ]),
                // validator: (value) =>
                //     value!.isEmpty ? 'Preencha o campo' : null,
              ),
              const SizedBox(height: 15),
              MeutextformWidget(
                label: 'Senha',
                controller: senhaEC,
                onChanged: _authController.setSenha,
                obscureText: true,
                suffix: 'sim',
                validator: Validatorless.multiple([
                  Validatorless.required('Senha requerida'),
                  Validatorless.min(4, 'Mínimo: 4 caracteres'),
                  Validatorless.max(12, 'Máximo: 12 caracteres'),
                  Validators.contemEspaco('Não pode ter espaço'),
                ]),
              ),
              const SizedBox(height: 35),
              ElevatedButton(
                onPressed: () async {
                  bool validacao = _formKey.currentState?.validate() ?? false;
                  // ignore: unused_local_variable
                  String? nomeEncontrado, senhaEncontrada;
                  if (validacao) {
                    setState(() {
                      visible = false;
                    });
                    await _authController.getUsers();
                    setState(() {
                      visible = true;
                    });

                    if (_authController.listUsers.isNotEmpty) {
                      for (var item in _authController.listUsers) {
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
                        Modular.to.navigate('./home');
                      } else {
                        asuka.AsukaSnackbar.alert("Usuário ou senha incorretos")
                            .show();
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        dismissDirection: DismissDirection.up,
                        content: Text('Não tem usuario cadastrado na base'),
                      ));

                      // meuErroDialog(context);
                    }
                  }
                },
                child: visible
                    ? const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          color: DuroSystemColors.meioBranco,
                        ),
                      )
                    : Container(
                        height: 16,
                        width: 16,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 13, vertical: 2),
                        child: const CircularProgressIndicator(
                          color: DuroSystemColors.meioBranco,
                        )),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    primary: DuroSystemColors.vermelho,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
              ),
              const Spacer(flex: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Não tem uma conta?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DuroSystemColors.vermelho),
                  ),
                  TextButton(
                    onPressed: () => Modular.to.navigate('./register'),
                    child: const Text(
                      'Cadastre-se',
                      style: TextStyle(
                        color: Colors.grey,
                        decorationColor: Colors.black,
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
