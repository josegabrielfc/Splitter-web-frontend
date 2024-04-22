import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/models/sidebar_item.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/providers/sidebar_provider.dart';

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

