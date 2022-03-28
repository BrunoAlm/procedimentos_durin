import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/modules/chamados/chamados_page.dart';

class ChamadosModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (p0, p1) => const ChamadosPage()),
  ];

}