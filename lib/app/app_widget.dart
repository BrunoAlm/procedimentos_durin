import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:procedimentos_durin/app/design/durosystem.dart';

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
      title: 'Procedimentos Durín',
      theme: ThemeData(
          primarySwatch: DuroSystemColors.paletaVermelho, fontFamily: 'Nunito'),
    ).modular();
  }
}
