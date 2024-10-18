import 'package:flutter/material.dart';

class AppBarShared extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const AppBarShared({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF4C8BF5), // Azul claro vibrante
              Color(0xFF3B82F6), // Azul más intenso
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 4,
    );
  }

  // Debes proporcionar el tamaño de la barra de la aplicación
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}