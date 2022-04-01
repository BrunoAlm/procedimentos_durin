import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/auth_store.dart';

class BotaoDoOlhinho extends StatefulWidget {
  const BotaoDoOlhinho({Key? key, required this.onPressed}) : super(key: key);
  final Function()? onPressed;
  @override
  State<BotaoDoOlhinho> createState() => _BotaoDoOlhinhoState();
}

class _BotaoDoOlhinhoState extends State<BotaoDoOlhinho> {
  final AuthController _authController = Modular.get();

  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.onPressed,
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: 10, top: 5),
      splashRadius: 20,
      constraints: const BoxConstraints(
        minWidth: 2,
        minHeight: 2,
      ),
      icon: Icon(
        _authController.obscureText
            ? Icons.remove_red_eye_outlined
            : Icons.no_encryption,
        color: DuroSystemColors.vermelho,
      ),
    );
  }
}
