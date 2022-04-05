import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/botaoDoOlhinho.dart';

// ignore: must_be_immutable
class MeutextformWidget extends StatefulWidget {
  MeutextformWidget({
    Key? key,
    required this.label,
    required this.controller,
    required this.validator,
    required this.onChanged,
    this.suffix,
    this.obscureText = false,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final String? suffix;
  bool obscureText;

  @override
  State<MeutextformWidget> createState() => _MeutextformWidgetState();
}

class _MeutextformWidgetState extends State<MeutextformWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      style: const TextStyle(
          color: DuroSystemColors.vermelho,
          textBaseline: TextBaseline.alphabetic),
      toolbarOptions: const ToolbarOptions(
        paste: true,
      ),
      decoration: InputDecoration(
        label: Text(widget.label),
        labelStyle: const TextStyle(
            color: DuroSystemColors.vermelho, fontWeight: FontWeight.bold),
        enabledBorder: _minhaBorder(),
        focusedBorder: _minhaBorder(),
        errorBorder: _minhaBorder(),
        focusedErrorBorder: _minhaBorder(),
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
        suffix: widget.suffix == 'sim'
            ? BotaoDoOlhinho(
                onPressed: () {
                  setState(() {
                    widget.obscureText = !widget.obscureText;
                  });
                },
              )
            : const SizedBox(),
        contentPadding: const EdgeInsets.only(left: 20),
        constraints: const BoxConstraints(maxWidth: 300),
      ),
    );
  }
}

OutlineInputBorder _minhaBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: DuroSystemColors.vermelho, width: 2),
    );
