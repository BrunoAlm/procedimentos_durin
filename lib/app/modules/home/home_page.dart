import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/home/services/constants.dart';
import 'package:procedimentos_durin/app/modules/home/view/desktop/desktop_view.dart';
import 'package:procedimentos_durin/app/modules/home/view/mobile/mobile_view.dart';
import 'package:procedimentos_durin/app/modules/home/view/tablet/tablet_view.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  var vermelho1 = DuroSystemColors.vermelho;

  List<BoxShadow> fizElevation = [
    const BoxShadow(color: Color.fromARGB(66, 0, 0, 0), offset: Offset(0, 1)),
    const BoxShadow(
        color: Color.fromARGB(96, 58, 58, 58), offset: Offset(0, 2)),
    const BoxShadow(
        color: Color.fromARGB(115, 87, 87, 87), offset: Offset(0, 3)),
    const BoxShadow(
        color: Color.fromARGB(31, 185, 185, 185), offset: Offset(0, 4)),
  ];

  @override
  Widget build(BuildContext context) {
    // var _largura = MediaQuery.of(context).size.width;
    // var _altura = MediaQuery.of(context).size.height;
    return SafeArea(
      child: LayoutBuilder(builder: (context, constraints) {
        return constraints.maxWidth < mobile
            ? const MobileView(title: 'Mobile')
            : constraints.maxWidth < tablet
                ? const TabletView(title: 'Tablet')
                : const DesktopView(title: 'Desktop');
        // appBar: AppBar(
        //   title: const Text('Counter'),
        // ),
        // body: Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     ScopedBuilder<HomeStore, Exception, int>(
        //       store: store,
        //       onState: (_, counter) {
        //         return Padding(
        //           padding: const EdgeInsets.all(10),
        //           child: Text('$counter'),
        //         );
        //       },
        //       onError: (context, error) => const Center(
        //         child: Text(
        //           'Too many clicks',
        //           style: TextStyle(color: Colors.red),
        //         ),
        //       ),
        //     ),
        //     const SizedBox(height: 100),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //       child: ElevatedButton(
        //           onPressed: () {
        //             Modular.to.pushNamed('./chamado/');
        //           },
        //           child: const Text('Chamados')),
        //     ),
        //     const SizedBox(height: 10),
        //     Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //       child: ElevatedButton(
        //           onPressed: () {
        //             Modular.to.popAndPushNamed('/auth/login');
        //           },
        //           child: const Text('Sair')),
        //     ),
        //   ],
        // ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     store.increment();
        //   },
        //   child: const Icon(Icons.add),
        // ),
      }),
    );
  }
}
