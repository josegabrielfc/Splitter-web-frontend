import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';


class UsuarioProvider extends ChangeNotifier {
  UsuarioModel? _usuario;
  String? _token;

  // Método para actualizar el usuario y notificar a los escuchas
  void setUsuario(UsuarioModel nuevoUsuario) {
    _usuario = nuevoUsuario;
    notifyListeners();
  }

  // Método get para obtener el usuario
  UsuarioModel? get usuario => _usuario;

  void vaciarUsuarioProvider() {
    _usuario = null;
    notifyListeners();
  }

    // Método get para obtener el token
  String? get token => _token;
  
   void setToken(String token) {
    _token=token;
    notifyListeners();
  }
}
