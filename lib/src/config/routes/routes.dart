import 'package:flutter_deep_linking/flutter_deep_linking.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/Resultados/resultado_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/Estudiantes/Resultados/revisar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/registrar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/app_admin.dart';
import 'package:splitter_web_frontend/src/pages/pages.dart' ;

final router = Router(routes: [
  Route(routes: [
    Route(
      matcher: Matcher.path(LoginPage.name),
      materialBuilder: (_, __) => const LoginPage(),
    ),
    Route(
      matcher: Matcher.path(AppAdmin.name),
      materialBuilder: (_, __) => const AppAdmin(),
    ),
    Route(
      matcher: Matcher.path(RegistrarEstudiantePage.name),
      materialBuilder: (_, __) => const RegistrarEstudiantePage(),
    ),
    Route(
      matcher: Matcher.path(RevisarEstudiantesPage.name),
      materialBuilder: (_, __) => const RevisarEstudiantesPage(),
    ),
    Route(
      matcher: Matcher.path(ResultadoEstudiantesPage.name),
      materialBuilder: (_, __) => const ResultadoEstudiantesPage(),
    ),
  ])
]);
