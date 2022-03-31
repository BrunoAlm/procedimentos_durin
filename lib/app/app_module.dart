import 'package:flutter_modular/flutter_modular.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:procedimentos_durin/app/modules/auth/auth_module.dart';
import 'package:procedimentos_durin/app/modules/home/home_module.dart';
import 'package:procedimentos_durin/app/modules/splash/splash_module.dart';
import 'package:procedimentos_durin/app/modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind(
      (i) => HasuraConnect("https://procedimentos-durin.hasura.app/v1/graphql",
          headers: {
            'x-hasura-admin-secret':
                'UQWt54LcSNSqtlkJMXSeMtKbb8sIi4absKtFs1dqJphBigKnUIKAkQhJ32nbi7PB',
            'content-type': 'application/json',
          }),
    )
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute(Modular.initialRoute, child: (p0, p1) => const SplashPage()),
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    // ModuleRoute('/home', module: HomeModule()),
    // ModuleRoute('/home/chamado', module: ChamadosModule()),
  ];
}
