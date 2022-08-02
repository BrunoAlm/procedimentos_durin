import 'package:flutter/material.dart';
import 'package:procedimentos_durin/app/design/durosystem.dart';
import 'package:procedimentos_durin/app/modules/auth/controller/validators.dart';
import 'package:procedimentos_durin/app/modules/auth/widgets/meutextform_widget.dart';

class CriarChamadosPage extends StatefulWidget {
  final String title;

  const CriarChamadosPage({Key? key, required this.title}) : super(key: key);

  @override
  State<CriarChamadosPage> createState() => _CriarChamadosPageState();
}

class _CriarChamadosPageState extends State<CriarChamadosPage> {
  @override
  Widget build(BuildContext context) {
    double _alturaDaTela = MediaQuery.of(context).size.height;
    double _larguraDaTela = MediaQuery.of(context).size.width;
    Object? dropdownValue;
    final nomeEC = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: double.infinity,
          maxWidth: double.infinity,
        ),
        child: Center(
          child: Container(
            height: _alturaDaTela * .8,
            width: _larguraDaTela * .8,
            decoration: BoxDecoration(
              border: Border.all(color: DuroSystemColors.vermelho, width: 2),
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Dados do Requerente',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      MeutextformWidget(
                        label: 'Nome Completo',
                        controller: nomeEC,
                        validator: Validators.contemEspaco('message'),
                        onChanged: (asd) => ' (as) {' '}',
                        maxLength: 15,
                      ),
                      const SizedBox(height: 20),
                      MeutextformWidget(
                        label: 'Email',
                        controller: nomeEC,
                        validator: Validators.contemEspaco('message'),
                        onChanged: (asd) => ' (as) {' '}',
                        maxLength: 15,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    children: [
                      const Text(
                        'Dados do chamado',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      DropdownButton(
                        value: dropdownValue,
                        items: const [
                          DropdownMenuItem(
                            value: 'Option 1',
                            child: Text('Option 1'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 2',
                            child: Text('Option 2'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 3',
                            child: Text('Option 3'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 4',
                            child: Text('Option 4'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 5',
                            child: Text('Option 5'),
                          ),
                          DropdownMenuItem(
                            value: 'Option 6',
                            child: Text('Option 6'),
                          ),
                        ],
                        onChanged: (value) {
                          setState(() {
                            dropdownValue = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      const Text(
                        'Descrição do chamado',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: DuroSystemColors.vermelho, width: 2),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add_a_photo),
                          SizedBox(width: 10),
                          Icon(Icons.format_bold),
                          SizedBox(width: 10),
                          Icon(Icons.format_align_center),
                          SizedBox(width: 10),
                          Icon(Icons.format_color_text),
                          SizedBox(width: 10),
                          Icon(Icons.format_size),
                          SizedBox(width: 10),
                          Icon(Icons.format_list_numbered),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
