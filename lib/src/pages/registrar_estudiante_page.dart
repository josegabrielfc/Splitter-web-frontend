import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';

class RegistrarEstudiante extends StatefulWidget {
  static const name = 'registrar-estudiante';
  const RegistrarEstudiante({super.key});

  @override
  State<RegistrarEstudiante> createState() => _RegistrarEstudianteState();
}

class _RegistrarEstudianteState extends State<RegistrarEstudiante> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SidebarWidget(),
      body: Container(
          child: Row(
        children: [
           Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/foto-colegio.png'),
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      )),
    );
  }
}

