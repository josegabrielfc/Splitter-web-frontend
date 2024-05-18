import 'dart:convert';
import 'package:splitter_web_frontend/src/models/global_models.dart';
import 'package:splitter_web_frontend/src/models/login/login_model.dart';
import 'package:splitter_web_frontend/src/services/mixins/login_service.dart';
import 'package:http/http.dart' as http;

class LoginServiceImlp with LoginService {
  @override
  Future<Response> login(LoginModel loginRequest) async {
    const String url = 'http://184.72.72.79:8080/login';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(loginRequest),
    );

    final responseBody = json.decode(response.body);
    final Response respuesta = Response.fromJson(responseBody);

    return respuesta;
  }
}
