import 'package:flutter/material.dart';

class ExibirChamadosPage extends StatefulWidget {
  final String title;
  const ExibirChamadosPage({Key? key, required this.title})
      : super(key: key);
  @override
  ExibirChamadosPageState createState() => ExibirChamadosPageState();
}

class ExibirChamadosPageState extends State<ExibirChamadosPage> {
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
