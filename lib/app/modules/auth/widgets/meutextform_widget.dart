import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class MeutextformWidget extends StatelessWidget {
  const MeutextformWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.validator, required this.onChanged,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white),
      toolbarOptions: const ToolbarOptions(
        paste: true,
      ),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
            color: DuroSystemColors.meioBranco, fontWeight: FontWeight.bold),
        enabledBorder: minhaBorder(),
        focusedBorder: minhaBorder(),
        errorBorder: minhaBorder(),
        focusedErrorBorder: minhaBorder(),
        hintMaxLines: 1,
        floatingLabelStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
        errorStyle: const TextStyle(
          color: Colors.black54,
          fontSize: 14,
          //backgroundColor: Colors.white.withOpacity(0.5),
          wordSpacing: 1.4,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          height: 0.8,
          decoration: TextDecoration.underline,
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(maxWidth: 300),
      ),
    );
  }
}

OutlineInputBorder minhaBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          const BorderSide(color: DuroSystemColors.meioBranco, width: 2),
    );
