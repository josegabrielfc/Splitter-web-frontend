import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/models/user.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';

class HeaderPage extends StatelessWidget {
  const HeaderPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: const Text(name),
          centerTitle: true,
        ),
        body: Image.network(
          urlImage,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      );
}
