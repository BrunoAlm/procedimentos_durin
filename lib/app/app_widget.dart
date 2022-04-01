import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: asuka.builder,
      navigatorObservers: [
        asuka.asukaHeroController //if u don`t add this Hero will not work
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
    ).modular();
  }
}
