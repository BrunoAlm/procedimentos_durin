import 'package:procedimentos_durin/app/modules/auth/controller/user_repository.dart';
import 'package:procedimentos_durin/app/modules/auth/view/auth_page.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/modules/auth/view/register_page.dart';
import 'package:procedimentos_durin/app/modules/home/home_module.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthController(i())),
    //  Bind((i) => HomeController(i())),
    Bind((i) => UserRepository(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/login',
        child: (p0, p1) => const AuthPage(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 500)),
    ChildRoute('/register',
        child: (p0, p1) => const RegisterPage(),
        transition: TransitionType.fadeIn,
        duration: const Duration(milliseconds: 500)),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
