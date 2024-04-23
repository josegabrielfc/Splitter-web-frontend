import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/services/implements/login_service_imlp.dart';
import 'package:splitter_web_frontend/src/services/mixins/login_service.dart';

class ServicesProvider extends ChangeNotifier {
  final LoginService _loginService = LoginServiceImlp();

  LoginService get loginService {
    return _loginService;
  }
}
