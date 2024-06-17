//import 'package:flutter/foundation.dart' show debugDefaultTargetPlatformOverride;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/config/helpers/local_storage.dart';
import 'package:splitter_web_frontend/src/config/routes/routes.dart';
import 'package:splitter_web_frontend/src/pages/Admin/Sidebar/registrar_estudiante_page.dart';
import 'package:splitter_web_frontend/src/pages/Admin/app_admin.dart';
import 'package:splitter_web_frontend/src/pages/Login/login_page.dart';
import 'package:splitter_web_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_web_frontend/src/providers/service_provider.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  await initializeDateFormatting('es', null);
  initializeDateFormatting().then((_) => runApp(const AppState()));
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigatorProvider()),
        ChangeNotifierProvider(create: (_) => ServicesProvider()),
        ChangeNotifierProvider(create: (_) => UsuarioProvider()),
        /*ChangeNotifierProvider(create: (_) => DatosGlobalesProvider()),
        */
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  static const String title = 'Splitter';

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return LocalStorage.getToken() == null ? const LoginPage() : const AppAdmin();
        },
      ),
      GoRoute(
        path: '/login',
        builder: (BuildContext context, GoRouterState state) {
          return const LoginPage();
        },
      ),GoRoute(
        path: '/admin',
        builder: (BuildContext context, GoRouterState state) {
          return LocalStorage.getToken() == null ? const LoginPage() : const AppAdmin();
        },
      ),
      GoRoute(
        path: '/registrar-estudiante',
        builder: (BuildContext context, GoRouterState state) {
          return LocalStorage.getToken() == null ? const LoginPage() : const RegistrarEstudiantePage();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      onGenerateRoute: router.onGenerateRoute,
      initialRoute: 'login-page',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es'),
      ],
      theme: ThemeData(
        useMaterial3: false,
        colorScheme: const ColorScheme.light().copyWith(primary: rojoColor),
      ),
      /*routes: {
        'admin-page': (context) => const AppAdmin(),
      },*/
    );
  }
}
