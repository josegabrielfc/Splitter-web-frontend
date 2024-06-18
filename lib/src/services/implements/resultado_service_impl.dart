import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/global_models.dart';
import 'package:splitter_web_frontend/src/models/resultado/resultado_model.dart';
import 'package:splitter_web_frontend/src/services/mixins/resultado_service.dart';

class ResultadoServiceImpl with ResultadoService {
  @override
  Future<Response> registrarResultado(
      String token, ResultadoformModel resultado) async {
    final String url = '$urlBase/resultados/guardarResultado';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(resultado));

    final responseBody = json.decode(response.body);
    final Response respuesta = Response.fromJson(responseBody);

    return respuesta;
  }

  @override
  Future<List<ResultadosModel>> listarResultados(
      String token, int idUsuario, int idTema) async {
    final String url = '$urlBase/resultados/results?idTema=$idTema&idUser=$idUsuario';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(Uri.parse(url), headers: headers);
    print("RESULTADOS TEMA: ${response.body}");
    if (response.statusCode == 200) {
      final decoded = jsonDecode(response.body);
      List<ResultadosModel> resultados = List<ResultadosModel>.from(
        decoded.map((json) => ResultadosModel.fromJson(json)),
      );
      return resultados;
    } else {
      return [];
    }
  }
}
