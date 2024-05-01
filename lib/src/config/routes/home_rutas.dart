/*
Son las páginas del home.
*/
import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/estudiantes_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/header_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/registrar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/app_admin.dart';

final Map<String, Widget> pages = {
  //Admin
  AppAdmin.name: const AppAdmin(),
  RegistrarEstudiantePage.name: const RegistrarEstudiantePage(),
  EstudiantesPage.name: const EstudiantesPage(),
  HeaderPage.name: const HeaderPage(),
};
