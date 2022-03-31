import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/modules/chamados/chamados_module.dart';
// import 'package:procedimentos_durin/app/modules/chamados/chamados_page.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const HomePage()),
    ModuleRoute('/chamado', module: ChamadosModule()),
    // ChildRoute('/chamado', child: (_, args) => const ChamadosPage()),
  ];
}
