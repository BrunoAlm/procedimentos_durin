import 'package:flutter_modular/flutter_modular.dart';
// import 'package:procedimentos_durin/app/modules/auth/auth_module.dart';
import 'package:procedimentos_durin/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: ((p0, p1) => const SplashPage())),
    
  ];
}
