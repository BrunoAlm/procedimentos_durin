import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class MobileView extends StatefulWidget {
  final String title;
  const MobileView({Key? key, required this.title}) : super(key: key);

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(color: DuroSystemColors.meioBranco),
      drawer: Drawer(
        backgroundColor: DuroSystemColors.meioBranco,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.close_rounded),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FloatingActionButton.extended(
                onPressed: () {},
                label: const Text(
                  'ABRIR CHAMADO',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
      ),
    );
  }
}
