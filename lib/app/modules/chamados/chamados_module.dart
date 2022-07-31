import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/modules/chamados/view/criar_chamados_page.dart';
import 'package:procedimentos_durin/app/modules/chamados/view/exibir_chamados_page.dart';

class ChamadosModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/criar',
      child: (p0, p1) => const CriarChamadosPage(
        title: 'Criação dos Chamados',
      ),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 200),
    ),
    ChildRoute(
      '/exibir',
      child: (p0, p1) => const ExibirChamadosPage(
        title: 'Exibe Abertos e Fechados, mas passa filtro via param',
      ),
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 200),
    ),
  ];
}
