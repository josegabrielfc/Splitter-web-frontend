import 'dart:convert';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/global_models.dart';

import 'package:http/http.dart' as http;
import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';
import 'package:splitter_web_frontend/src/services/mixins/usuario_service.dart';



class UsuarioServiceImlp with UsuarioService {
  @override
  Future<UsuarioModel> detalleUsuario(String correo, String token) async {
    final String url = '$urlBase/usuario/detalle?correo=$correo';

    final Map<String, String> headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
      'Accept': '*/*',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    final responseBody = json.decode(response.body);
    final UsuarioModel usuarioModel = UsuarioModel.fromJson(responseBody["msg"]);

    return usuarioModel;

  }

  @override
  Future<Response> registrarEstudiante(UsuarioRegistro usuarioRegistro) {
    // TODO: implement registrarEstudiante
    throw UnimplementedError();
  }
}