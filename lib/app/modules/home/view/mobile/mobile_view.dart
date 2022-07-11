import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/home/widgets/drawer.dart';

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
      drawer: const DrawerMobile(),
    );
  }
}
