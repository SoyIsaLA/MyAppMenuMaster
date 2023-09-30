import 'package:flutter/material.dart';

class Mesa1Widget extends StatefulWidget {
  const Mesa1Widget({Key? key}) : super(key: key);

  @override
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
          title: Text('Menu del Dia'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
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
                Divider(
                  thickness: 1,
                  color: Color(0xA3408787),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 25),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFFF5FBFB),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(12, 5, 12, 80),
                          child: Column(
                            children: [
                              Text(
                                'Entrada',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: [
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
                              Text(
                                'Principios',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: ['Frijol', 'Garbanzo', 'Calabacin'],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues2.add(label);
                                  } else {
                                    checkboxGroupValues2.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(
                                'Proteinas',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: [
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
                              Text(
                                'Ensalada',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: ['Dulce', 'Salada'],
                                onChange: (bool isChecked, String label) {
                                  if (isChecked) {
                                    checkboxGroupValues4.add(label);
                                  } else {
                                    checkboxGroupValues4.remove(label);
                                  }
                                  setState(() {});
                                },
                              ),
                              Text(
                                'Papa',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              CheckboxGroup(
                                labels: ['Francesa', 'Sudada'],
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
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 26),
                    child: ElevatedButton(
                      onPressed: () {
                        print('Button pressed ...');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color(0x8900A5A5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Container(
                        width: 275,
                        height: 43,
                        alignment: Alignment.center,
                        child: Text(
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

  CheckboxGroup({required this.labels, required this.onChange});

  @override
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
    MaterialApp(
      home: Scaffold(
        body: Mesa1Widget(),
      ),
    ),
  );
}
