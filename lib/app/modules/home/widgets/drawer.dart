import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

class DrawerMobile extends StatefulWidget {
  const DrawerMobile({Key? key}) : super(key: key);

  @override
  State<DrawerMobile> createState() => _DrawerMobileState();
}

class _DrawerMobileState extends State<DrawerMobile> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: DuroSystemColors.meioBranco,
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.close_rounded),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text(
              'ABRIR CHAMADO',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          TextButton.icon(
              onPressed: () {
                Modular.to.popAndPushNamed('/auth/login');
              },
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10)

                  // primary: DuroSystemColors.meioBranco,
                  ),
              icon: const Icon(Icons.exit_to_app),
              label: const Text(
                'Sair',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
