import 'package:flutter/material.dart';
import 'package:performance_record/presentation/shared/appbar_shared.dart';

class SupervisorScreen extends StatelessWidget {
  static const name = 'supervisor-screen';
  const SupervisorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const AppBarShared(title: 'Registrar supervisor'),
      body: Container(
        // El Container ahora ocupa todo el espacio
        decoration: const BoxDecoration(
          color: Color(0xFFE3F2FD), // Azul más claro como fondo
        ),
        child: Center(
          // Centra el contenido
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.supervisor_account,
                    size: 80,
                    color: Color(0xFF1D4ED8), // Color del icono
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Ingresa el nombre del supervisor',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.teal),
                      ),
                      hintText: 'Nombre del Supervisor',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[50],
                      contentPadding:
                          const EdgeInsets.all(15), // Padding interno
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón (guardar registro)
                    },
                    style: ElevatedButton.styleFrom(
                      // Color de fondo del botón
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(12), // Bordes redondeados
                      ),
                      elevation: 6,
                      backgroundColor: const Color(0xFF1D4ED8), // Azul oscuro
                    ),
                    child: const Text(
                      'Registrar',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
