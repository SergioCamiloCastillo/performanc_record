import 'package:flutter/material.dart';
import 'package:performance_record/config/router/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:performance_record/presentation/shared/appbar_shared.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar:  const AppBarShared(title: 'Registro de supervisión'),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE0F7FA), // Azul muy suave
              Color(0xFFBBDEFB), // Azul más intenso hacia el fondo
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              children: [
                _buildButton(
                  context,
                  'Registrar Supervisor',
                  Icons.supervisor_account,
                  Colors.orange.shade400,
                  () => context.go('/supervisor'), // Cambiado a GoRouter
                ),
                _buildButton(
                  context,
                  'Productos',
                  Icons.local_florist,
                  Colors.blue.shade400,
                  () => context.go('/products'), // Cambiado a GoRouter
                ),
                _buildButton(
                  context,
                  'Actividades',
                  Icons.handyman,
                  Colors.green.shade400,
                  () => context.go('/activities'), // Cambiado a GoRouter
                ),
                _buildButton(
                  context,
                  'Registrar Rendimiento',
                  Icons.assessment,
                  Colors.purple.shade400,
                  () => context.go('/'), // Cambiado a GoRouter
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return Card(
      elevation: 8, // Sombra en las tarjetas
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Bordes más redondeados
      ),
      child: InkWell(
        onTap: onPressed, // Llamamos a onPressed directamente
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: color, // Color de fondo específico para cada botón
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.8), // Color principal
                color.withOpacity(1.0), // Color más fuerte
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 60, color: Colors.white), // Ícono más grande
              const SizedBox(height: 10),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18, // Texto más grande
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
