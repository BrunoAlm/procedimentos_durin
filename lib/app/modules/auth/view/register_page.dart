import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/auth_store.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meuDropdown.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meutextform_widget.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = Modular.get();
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  List<String> listaSetores = [
    'ADM DE VENDAS',
    'GERÊNCIA COMERCIAL',
    'PRODUÇÃO - INJEÇÃO',
    'PRODUÇÃO - EXTRUSÃO',
    'PRODUÇÃO - SOPRO',
    'PROJETOS',
    'QUALIDADE',
    'QUÍMICA',
    'SAC',
    'TI - SISTEMAS',
    'TI - INFRAESTRUTURA',
    'TELEVENDAS',
  ];

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
    final setorEC = TextEditingController();
    // var model = UserModel(usuario: usuarioEC.text, senha: senhaEC.text);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DuroSystemColors.vermelho,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Modular.to.navigate('./login');
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: DuroSystemColors.vermelho,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  'assets/splash_screen_logo.png',
                  color: DuroSystemColors.meioBranco,
                ),
                const SizedBox(height: 30),
                const Text(
                  'Criar conta',
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
                  validator: (value) =>
                      value!.isEmpty ? 'Preencha o campo' : null,
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                CustomDropdownButton2(
                  dropdownItems: listaSetores,
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value as String;
                    });
                  },
                  hint: 'Selecione o setor',
                  buttonHeight: 50,
                  buttonWidth: 300,
                  offset: const Offset((300 * 0.07), -10),
                  dropdownWidth: 250,
                  dropdownHeight: 150,
                  itemHeight: 40,
                  scrollbarAlwaysShow: true,
                ),
                const SizedBox(height: 35),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _authController.addUser();
                      Modular.to.navigate('./login');
                    }
                  },
                  child: visible
                      ? const Text(
                          'Criar conta',
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
