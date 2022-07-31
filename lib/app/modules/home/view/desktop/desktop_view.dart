import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class DesktopView extends StatefulWidget {
  final String title;
  const DesktopView({Key? key, required this.title}) : super(key: key);

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  late double larguraDrawer;
  bool isExpanded = false;

  @override
  void initState() {
    larguraDrawer = 80;
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double _larguraTela = MediaQuery.of(context).size.width;
    double _alturaTela = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: DuroSystemColors.meioBranco,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 18,
          onPressed: () {
            setState(() {
              larguraDrawer = isExpanded ? 80 : 200;
              Future.delayed(
                const Duration(milliseconds: 100),
                () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              );
            });
          },
          icon: const Center(child: Icon(Icons.list)),
        ),
        actions: const [
          CircleAvatar(
            maxRadius: 20,
            backgroundColor: DuroSystemColors.meioBranco,
            child: Center(
                child: Text(
              'img',
              style: TextStyle(fontSize: 12),
            )),
          ),
          SizedBox(width: 20),
        ],
        title: Text(widget.title),
      ),
      body: Row(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 200,
              maxHeight: double.infinity,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: larguraDrawer,
              decoration: BoxDecoration(
                color: DuroSystemColors.meioBranco,
                border: Border(
                  right: BorderSide(
                    width: 2,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    FloatingActionButton.extended(
                      onPressed: () => Modular.to.pushNamed('chamados/criar'),
                      label: isExpanded
                          ? const Text(
                              'ABRIR CHAMADO',
                              style: TextStyle(
                                  // color: DuroSystemColors.vermelho,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0),
                            )
                          : const SizedBox(
                              height: 20,
                              width: 20,
                              child: Icon(
                                Icons.add,
                                // color: DuroSystemColors.vermelho,
                                size: 18,
                              ),
                            ),
                      // backgroundColor: DuroSystemColors.vermelho,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Modular.to.pushNamed('chamados/exibir'),
                      child: isExpanded
                          ? const Text('Abertos')
                          : const Icon(Icons.list_alt),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Modular.to.pushNamed('chamados/exibir'),
                      child: isExpanded
                          ? const Text('Concluídos')
                          : const Icon(Icons.done_all_outlined),
                    ),
                    const Divider(),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton.icon(
                        onPressed: () {
                          Modular.to.popAndPushNamed('/auth/login');
                        },
                        style: TextButton.styleFrom(
                          padding: isExpanded
                              ? const EdgeInsets.symmetric(horizontal: 10)
                              : EdgeInsets.zero,
                          // primary: DuroSystemColors.meioBranco,
                        ),
                        icon: const Icon(Icons.exit_to_app),
                        label: isExpanded
                            ? const Text(
                                'Sair',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 10),

                    // SizedBox(
                    //   height: 30,
                    //   child: TextField(
                    //     style: const TextStyle(
                    //       fontSize: 12,
                    //       color: DuroSystemColors.meioBranco,
                    //     ),
                    //     cursorHeight: 15,
                    //     decoration: InputDecoration(
                    //       border: _minhaBorder(),
                    //       focusedBorder: _minhaBorder(),
                    //       enabledBorder: _minhaBorder(),
                    //       errorBorder: _minhaBorder(),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: _alturaTela * .8,
                  maxWidth: _larguraTela * .8,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: DuroSystemColors.vermelho,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    color: DuroSystemColors.meioBranco,
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                  color: Colors.black.withOpacity(0.2)),
                              left: BorderSide(
                                  color: Colors.black.withOpacity(0.2)),
                            ),
                          ),
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            'Dashboard - Resumo mensal',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black.withOpacity(0.6),
                              ),
                            ),
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.red.withOpacity(.6),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              FlutterLogo(size: 50),
                                              SizedBox(height: 20),
                                              Text(
                                                  'Gráfico manero, seleciona os pontos e mostra o tanto'),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  Colors.green.withOpacity(.6),
                                            ),
                                          ),
                                          child: const Center(
                                            child: Text(
                                                'quem que abriu mais e pá e os numero'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.deepPurple
                                                .withOpacity(.6),
                                          ),
                                        ),
                                        child: const Center(
                                          child: Text(
                                              'n sei q tem coisarada demais\ntop demais os negocio'),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue.withOpacity(.6),
                                          ),
                                        ),
                                        child: const FlutterLogo(),
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: IconButton(
          //     color: Colors.black,
          //     onPressed: () {
          //       setState(() {
          //         larguraDrawer = isExpanded ? 70 : 200;
          //         Future.delayed(
          //           const Duration(milliseconds: 100),
          //           () {
          //             setState(() {
          //               isExpanded = !isExpanded;
          //             });
          //           },
          //         );
          //       });
          //     },
          //     icon: const Icon(Icons.list_rounded),
          //   ),
          // ),
        ],
      ),
    );
  }
}

// OutlineInputBorder _minhaBorder() => OutlineInputBorder(
//       borderRadius: BorderRadius.circular(10),
//       borderSide:
//           const BorderSide(color: DuroSystemColors.meioBranco, width: 2),
//     );
