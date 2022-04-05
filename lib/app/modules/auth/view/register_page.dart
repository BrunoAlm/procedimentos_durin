import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/auth_store.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/validators.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meuDropdown.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meutextform_widget.dart';
import 'package:validatorless/validatorless.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final AuthController _authController = Modular.get();
  final _formKey = GlobalKey<FormState>();
  // String? selectedValue;
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

    var _larguraDaTela = MediaQuery.of(context).size.width;
    var _alturaDaTela = MediaQuery.of(context).size.height;
    bool isMobile = _larguraDaTela <= 500 ? true : false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: DuroSystemColors.meioBranco,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Modular.to.navigate('./login');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: DuroSystemColors.vermelho,
            )),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: DuroSystemColors.meioBranco,
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: isMobile ? _alturaDaTela * 0.9 : _alturaDaTela * 0.9,
            maxWidth: isMobile ? _larguraDaTela * 0.9 : _larguraDaTela * 0.4,
          ),
          child: SizedBox.expand(
            child: Card(
              // color: Colors.black.withOpacity(0.3),
              margin: const EdgeInsets.only(top: 30),
              color: DuroSystemColors.meioBranco,
              elevation: 10,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset(
                      'assets/splash_screen_logo.png',
                      color: DuroSystemColors.vermelho,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Criar conta',
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
                    ),
                    const SizedBox(height: 15),
                    MeutextformWidget(
                      label: 'Senha',
                      controller: senhaEC,
                      onChanged: _authController.setSenha,
                      obscureText: true,
                      validator: Validatorless.multiple([
                        Validatorless.required('Senha requerida'),
                        Validatorless.min(4, 'Mínimo: 4 caracteres'),
                        Validatorless.max(12, 'Máximo: 12 caracteres'),
                        Validators.contemEspaco('Não pode ter espaço'),
                      ]),
                      suffix: 'sim',
                    ),
                    const SizedBox(height: 15),
                    CustomDropdownButton2(
                      value: _authController.selectedValue,
                      validator: (value) {
                        return value == null ? 'Preencha o campo' : null;
                      },
                      dropdownItems: listaSetores,
                      onChanged: (value) {
                        _authController.selectedValue = value as String;
                        _authController.setSetor(value);
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
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
