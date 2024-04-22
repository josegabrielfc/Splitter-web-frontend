/*
Son las páginas del home.
*/
import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/pages/Admin/app_admin.dart';
import 'package:splitter_web_frontend/src/pages/pages.dart';

final Map<String, Widget> pages = {
  //Admin
  AppAdmin.name: const AppAdmin(),
  RegistrarEstudiante.name: const RegistrarEstudiante(),
};
