import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/models/tema_model.dart';
import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';


class UsuarioProvider extends ChangeNotifier {
  UsuarioModel? _usuario;
  String? _token;
  List<TemaModel>? _temas;

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

  // Método para actualizar los temas y notificar a los escuchas
  void setTemas(List<TemaModel> temas) {
    _temas = temas;
    notifyListeners();
  }

  List<TemaModel>? get temas => _temas;

  // Método para buscar un tema por nombre
  int? buscarTemaPorNombre(String nombre) {
    try {
      return _temas?.firstWhere((tema) => tema.nombre == nombre).id;
    } catch (e) {
      return -1; // Retorna -1 si no encuentra el tema
    }
  }
}
