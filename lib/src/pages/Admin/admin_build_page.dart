import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/models/sidebar_item.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/editar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/estudiantes_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/header_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/notifications_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/plugins_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/registrar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/workflow_page.dart';
import 'package:splitter_web_frontend/src/providers/sidebar_provider.dart';

class AdminBuildPage extends StatefulWidget {
  const AdminBuildPage({super.key});

  @override
  State<AdminBuildPage> createState() => _AdminBuildPageState();
}

class _AdminBuildPageState extends State<AdminBuildPage> {
  @override
   Widget build(BuildContext context) => buildPages();

  Widget buildPages() {
    final provider = Provider.of<SidebarProvider>(context);
    final navigationItem = provider.sidebarItem;

    switch (navigationItem) {
      case SidebarItem.header:
        return const HeaderPage();
      case SidebarItem.registrarUsuario:
        return const RegistrarEstudiantePage();
      case SidebarItem.estudiantes:
        return const EstudiantesPage();
      case SidebarItem.workflow:
        return const WorkflowPage();
      case SidebarItem.editarEstudiante:
        return const EditarEstudiantePage();
      case SidebarItem.plugins:
        return const PluginsPage();
      case SidebarItem.notifications:
        return const NotificationsPage();
    }
  }
}