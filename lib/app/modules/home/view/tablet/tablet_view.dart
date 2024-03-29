import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/home/widgets/drawer.dart';

class TabletView extends StatefulWidget {
  final String title;
  const TabletView({Key? key, required this.title}) : super(key: key);

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerMobile(),
      body: Container(color: DuroSystemColors.meioBranco),
    );
  }
}
