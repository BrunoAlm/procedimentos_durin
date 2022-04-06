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
    larguraDrawer = 70;
    isExpanded = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DuroSystemColors.meioBranco,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 18,
          onPressed: () {
            setState(() {
              larguraDrawer = isExpanded ? 70 : 200;
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
          icon: const Icon(Icons.list),
        ),
        actions: [
          IconButton(
            splashRadius: 18,
            onPressed: () {},
            icon: const Icon(Icons.abc),
          ),
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
              decoration: const BoxDecoration(
                color: DuroSystemColors.meioBranco,
                border: Border(
                  right: BorderSide(
                    width: 3,
                    color: Colors.black12,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    FloatingActionButton.extended(
                      onPressed: () {},
                      label: isExpanded
                          ? const Text(
                              'ABRIR CHAMADO',
                              style: TextStyle(
                                // color: DuroSystemColors.vermelho,
                                fontWeight: FontWeight.bold,
                              ),
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

OutlineInputBorder _minhaBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          const BorderSide(color: DuroSystemColors.meioBranco, width: 2),
    );
