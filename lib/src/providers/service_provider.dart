import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/services/implements/login_service_imlp.dart';
import 'package:splitter_web_frontend/src/services/implements/usuario_service_impl.dart';
import 'package:splitter_web_frontend/src/services/mixins/login_service.dart';
import 'package:splitter_web_frontend/src/services/mixins/usuario_service.dart';

class ServicesProvider extends ChangeNotifier {
  final LoginService _loginService = LoginServiceImlp();
  final UsuarioService _usuarioService = UsuarioServiceImlp();

  LoginService get loginService {
    return _loginService;
  }

  UsuarioService get usuarioService {
    return _usuarioService;
  }
}
