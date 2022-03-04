import 'package:flutter/material.dart';

class BackgroundLoginPage extends StatelessWidget {
  const BackgroundLoginPage({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    var _altura = MediaQuery.of(context).size.height;
    var _largura = MediaQuery.of(context).size.width;

    return Container(
      height: _altura,
      width: _largura,
      color: const Color.fromARGB(255, 212, 52, 40),
      child: child,
    );
  }
}

class MeuTextFormField extends StatelessWidget {
  const MeuTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.obscureText,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white, width: 4),
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(maxWidth: 300),
      ),
    );
  }
}
