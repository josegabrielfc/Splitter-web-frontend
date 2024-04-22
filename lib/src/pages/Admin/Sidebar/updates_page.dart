import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';

class UpdatesPage extends StatelessWidget {
  const UpdatesPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Updates'),
          centerTitle: true,
          backgroundColor: Colors.pink,
        ),
      );
}
