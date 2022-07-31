import 'package:flutter/material.dart';

class CriarChamadosPage extends StatefulWidget {
  final String title;

  const CriarChamadosPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CriarChamadosPage> createState() => _CriarChamadosPageState();
}

class _CriarChamadosPageState extends State<CriarChamadosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}
