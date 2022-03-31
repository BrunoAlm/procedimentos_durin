// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';

void meuErroDialog(BuildContext context) => showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title:
            const Text('Erro', style: TextStyle(fontWeight: FontWeight.bold)),
        content: const Text('Usuário ou senha inválidos'),
        actions: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: DuroSystemColors.vermelho,
                  padding:
                      const EdgeInsets.symmetric(vertical: 14, horizontal: 10)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Voltar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )))
        ],
      ),
    );
