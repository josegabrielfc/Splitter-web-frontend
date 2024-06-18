/*
Son las páginas del home.
*/
import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/Resultados/resultado_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/Resultados/revisar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/estudiantes_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/header_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/historial_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/registrar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/app_admin.dart';

final Map<String, Widget> pages = {
  //Admin
  AppAdmin.name: const AppAdmin(),
  HeaderPage.name: const HeaderPage(),
  RegistrarEstudiantePage.name: const RegistrarEstudiantePage(),
  EstudiantesPage.name: const EstudiantesPage(),
  RevisarEstudiantesPage.name: const RevisarEstudiantesPage(),
  ResultadoEstudiantesPage.name: const ResultadoEstudiantesPage(),
  HistorialPage.name: const HistorialPage(),
};
