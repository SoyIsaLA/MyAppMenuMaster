import 'package:flutter/material.dart';
import 'package:menumaster/pantallamesas.dart';

class Mesa1Widget extends StatefulWidget {
  const Mesa1Widget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Mesa1WidgetState createState() => _Mesa1WidgetState();
}

class _Mesa1WidgetState extends State<Mesa1Widget> {
  final List<String> checkboxGroupValues1 = [];
  final List<String> checkboxGroupValues2 = [];
  final List<String> checkboxGroupValues3 = [];
  final List<String> checkboxGroupValues4 = [];
  final List<String> checkboxGroupValues5 = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Menu del Dia'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  thickness: 1,
                  color: Color(0xA3408787),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 25),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF5FBFB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 5, 12, 80),
                          child: Column(
                            children: [
                              const Text(
                                'Entrada',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: const [
                                  'Sopa de pasta',
                                  'Crema de verdura',
                                  'Fruta'
                                ],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues1.add(label);
                                  } else {
                                    checkboxGroupValues1.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                              const Text(
                                'Principios',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: const [
                                  'Frijol',
                                  'Garbanzo',
                                  'Calabacin'
                                ],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues2.add(label);
                                  } else {
                                    checkboxGroupValues2.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                              const Text(
                                'Proteinas',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: const [
                                  'Res',
                                  'Cerdo',
                                  'Pollo Dorado',
                                  'Pollo Sudado',
                                  'Alitas BBQ',
                                  'Pechuga'
                                ],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues3.add(label);
                                  } else {
                                    checkboxGroupValues3.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                              const Text(
                                'Ensalada',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: const ['Dulce', 'Salada'],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues4.add(label);
                                  } else {
                                    checkboxGroupValues4.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                              const Text(
                                'Papa',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: const ['Francesa', 'Sudada'],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues5.add(label);
                                  } else {
                                    checkboxGroupValues5.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 26),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PantallaMesasWidget()));
                        // Agregar el mensaje
                        const snackBar = SnackBar(
                          content: Text('Pedido enviado a la cocina'),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0x8900A5A5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Container(
                        width: 275,
                        height: 43,
                        alignment: Alignment.center,
                        child: const Text(
                          'Realizar Pedido',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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

class CheckboxGroup extends StatefulWidget {
  final List<String> labels;
  final Function(bool, String) onChange;

  const CheckboxGroup(
      {super.key, required this.labels, required this.onChange});

  @override
  // ignore: library_private_types_in_public_api
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  List<bool> isCheckedList = [];

  @override
  void initState() {
    super.initState();
    isCheckedList = List<bool>.filled(widget.labels.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        widget.labels.length,
        (index) => CheckboxListTile(
          value: isCheckedList[index],
          onChanged: (value) {
            setState(() {
              isCheckedList[index] = value!;
            });
            widget.onChange(value!, widget.labels[index]);
          },
          title: Text(widget.labels[index]),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Mesa1Widget(),
      ),
    ),
  );
}
