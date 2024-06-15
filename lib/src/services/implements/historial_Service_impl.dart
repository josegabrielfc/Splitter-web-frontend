import 'dart:convert';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/historial/historial_model.dart';
import 'package:splitter_web_frontend/src/services/mixins/historial_service.dart';

import 'package:http/http.dart' as http;

import '../../models/global_models.dart';

class HistorialServiceImpl with HistorialService {
  @override
  Future<List<HistorialModel>> getHistorial(String token) async {
    String url = "$urlBase/historico/getAll";

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

    if (response.statusCode == 200) {
      List<dynamic> responseBody = json.decode(response.body);
      List<HistorialModel> historial = responseBody.map((dynamic item) {
        return HistorialModel.fromJson(item);
      }).toList();
      return historial;
    } else {
      return [];
    }

  }
  
  @override
  Future<Response> generarHistorial(String token) async {
   String url = "$urlBase/historico/generar";

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

    dynamic responseBody = json.decode(response.body);

    return Response.fromJson(responseBody);
  }
}