import 'package:flutter/material.dart';
import 'package:performance_record/presentation/shared/appbar_shared.dart';

class ActivitiesScreen extends StatelessWidget {
  static const name = 'activities-screen';
  const ActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarShared(title: 'Lista de Actividades'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
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
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: AnimatedListWidget(), // Usamos el widget de lista animada
        ),
      ),
    );
  }
}

class AnimatedListWidget extends StatelessWidget {
  const AnimatedListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // Número de actividades
      itemBuilder: (context, index) {
        // Pasamos el índice al AnimatedListItem
        return AnimatedListItem(index: index);
      },
    );
  }
}

class AnimatedListItem extends StatefulWidget {
  final int index;

  const AnimatedListItem({super.key, required this.index});

  @override
  _AnimatedListItemState createState() => _AnimatedListItemState();
}

class _AnimatedListItemState extends State<AnimatedListItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Inicializa el AnimationController
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300), // Duración de la animación
      vsync: this,
    );

    // Inicializa la animación de opacidad
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Inicia la animación con un retraso basado en el índice
    Future.delayed(Duration(milliseconds: widget.index * 150), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    // Limpia el controlador de animación
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            shadowColor: Colors.blueAccent.withOpacity(0.3),
            child: InkWell(
              onTap: () {
                // Acción al tocar la actividad
              },
              borderRadius: BorderRadius.circular(20),
              splashColor: Colors.blueAccent.withOpacity(0.2),
              child: Container(
                width: MediaQuery.of(context).size.width *
                    0.9, // Ajuste de ancho (90% de la pantalla)
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFBBDEFB), // Azul pastel suave
                      Color(0xFF90CAF9), // Azul más brillante
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.assignment, // Icono para actividades
                            size: 20,
                            color: Colors.blue.shade700,
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Ajustamos el ancho del texto
                        const SizedBox(
                          width:
                              150, // Ajustar el ancho para evitar desbordamiento
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Cortar el césped del jardín',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D47A1),
                                ),
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2, // Máximo de líneas
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Aquí se colocan los iconos
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.blue),
                          onPressed: () {
                            // Acción al presionar el botón de editar
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Acción al presionar el botón de eliminar
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
