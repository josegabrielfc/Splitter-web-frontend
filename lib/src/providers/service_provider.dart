import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/services/implements/historial_Service_impl.dart';
import 'package:splitter_web_frontend/src/services/implements/login_service_imlp.dart';
import 'package:splitter_web_frontend/src/services/implements/usuario_service_impl.dart';
import 'package:splitter_web_frontend/src/services/mixins/historial_service.dart';
import 'package:splitter_web_frontend/src/services/mixins/login_service.dart';
import 'package:splitter_web_frontend/src/services/mixins/usuario_service.dart';

class ServicesProvider extends ChangeNotifier {
  final LoginService _loginService = LoginServiceImlp();
  final UsuarioService _usuarioService = UsuarioServiceImlp();
  final HistorialService _historialService = HistorialServiceImpl();

  LoginService get loginService {
    return _loginService;
  }

  UsuarioService get usuarioService {
    return _usuarioService;
  }

  HistorialService get historialService {
    return _historialService;
  }
}
