import 'package:flutter/material.dart';

class ChamadosPage extends StatefulWidget {
  final String title;
  const ChamadosPage({Key? key, this.title = 'ChamadosPage'}) : super(key: key);
  @override
  ChamadosPageState createState() => ChamadosPageState();
}

class ChamadosPageState extends State<ChamadosPage> {
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
