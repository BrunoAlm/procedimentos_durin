import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/modules/auth/auth_module.dart';
// import 'package:procedimentos_durin/app/modules/chamados/chamados_module.dart';
import 'package:procedimentos_durin/app/modules/home/home_module.dart';
import 'package:procedimentos_durin/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (p0, p1) => const SplashPage()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule()),
    // ModuleRoute('/home/chamado', module: ChamadosModule()),
  ];
}