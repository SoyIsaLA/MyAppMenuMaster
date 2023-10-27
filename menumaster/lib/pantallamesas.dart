import 'package:flutter/material.dart';
import 'package:menumaster/main.dart';
import 'package:menumaster/menudia.dart';
import 'package:menumaster/perfilmesero.dart';

class PantallaMesasWidget extends StatelessWidget {
  PantallaMesasWidget({Key? key}) : super(key: key);

  // Lista de rutas de imágenes para las mesas
  final List<String> imagenesMesas = [
    'assets/mesa1.jpg',
    'assets/mesa2.jpg',
    'assets/mesa3.jpg',
    'assets/mesa4.jpg',
    'assets/mesa5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 30,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const PrincipalRestauranteWidget()));
          },
        ),
        title: const Text(
          'Ordenar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.person,
              color: Color(0xFF101518),
              size: 35,
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PerfilmeseroWidget()));
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Nuestras mesas están a continuación:',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: imagenesMesas
                  .length, // Usar la longitud de la lista de imágenes
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            imagenesMesas[
                                index], // Usar la ruta de imagen correspondiente
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Mesa ${index + 1}',
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Puedes agregar más información de la mesa aquí
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.arrow_forward_rounded,
                            color: Color.fromARGB(211, 79, 152, 152),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Mesa1Widget()));
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
