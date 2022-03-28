import 'package:procedimentos_durin/app/modules/auth/view/auth_page.dart';
import 'package:procedimentos_durin/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login', child: (p0, p1) => const AuthPage()),
  ];
}
