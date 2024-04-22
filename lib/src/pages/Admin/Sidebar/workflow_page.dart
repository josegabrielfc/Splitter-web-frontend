import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';

class WorkflowPage extends StatelessWidget {
  const WorkflowPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Workflow'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      );
}
