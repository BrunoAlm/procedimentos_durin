import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class MeutextformWidget extends StatelessWidget {
  final String title;
  const MeutextformWidget({
    Key? key,
    this.title = "MeutextformWidget",
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
        labelStyle: const TextStyle(color: DuroSystemColors.meioBranco),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: DuroSystemColors.meioBranco, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              const BorderSide(color: DuroSystemColors.meioBranco, width: 3),
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(maxWidth: 300),
      ),
    );
  }
}
