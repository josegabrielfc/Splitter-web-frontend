import 'package:flutter_deep_linking/flutter_deep_linking.dart';
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
      matcher: Matcher.path(RegistrarEstudiante.name),
      materialBuilder: (_, __) => const RegistrarEstudiante(),
    ),
  ])
]);
