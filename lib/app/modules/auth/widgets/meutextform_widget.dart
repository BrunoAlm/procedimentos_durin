import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class MeutextformWidget extends StatelessWidget {
  const MeutextformWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.obscureText,
    required this.validator,
    required this.onChanged,
    this.suffix,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final Widget? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      style: const TextStyle(
          color: DuroSystemColors.vermelho,
          textBaseline: TextBaseline.alphabetic),
      toolbarOptions: const ToolbarOptions(
        paste: true,
      ),
      decoration: InputDecoration(
        label: Text(label),
        labelStyle: const TextStyle(
            color: DuroSystemColors.vermelho, fontWeight: FontWeight.bold),
        enabledBorder: minhaBorder(),
        focusedBorder: minhaBorder(),
        errorBorder: minhaBorder(),
        focusedErrorBorder: minhaBorder(),
        hintMaxLines: 1,
        floatingLabelStyle: const TextStyle(
          color: DuroSystemColors.vermelho,
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
        suffix: suffix ?? const SizedBox(),
        contentPadding: const EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(maxWidth: 300),
      ),
    );
  }
}

OutlineInputBorder minhaBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: DuroSystemColors.vermelho, width: 2),
    );
