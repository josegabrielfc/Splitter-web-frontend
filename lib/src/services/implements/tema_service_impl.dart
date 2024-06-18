import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/tema_model.dart';
import 'package:splitter_web_frontend/src/services/mixins/tema_service.dart';

class TemaServiceImpl with TemaService {
  @override
  Future<List<TemaModel>> listarTemas(String token) async {
    final String url = '$urlBase/temas/all';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );
    print("TEMAS: ${response.body}");
    if (response.statusCode == 200) {
      final List<dynamic> decodedData = json.decode(response.body);
      final List<TemaModel> temas =
          decodedData.map((jsonItem) => TemaModel.fromJson(jsonItem)).toList();
      return temas;
    } else {
      return [];
    }
  }
}
