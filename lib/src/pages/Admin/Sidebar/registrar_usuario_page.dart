import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';

class RegistrarUsuarioPage extends StatelessWidget {
  const RegistrarUsuarioPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Registrar Usuario'),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
      );
}
