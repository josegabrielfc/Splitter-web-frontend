import 'package:splitter_web_frontend/src/models/global_models.dart';
import 'package:splitter_web_frontend/src/models/resultado/resultado_model.dart';

mixin ResultadoService {
  Future<Response> registrarResultado(String token, ResultadoformModel resultado);

  Future<List<ResultadosModel>> listarResultados(String token, int idUsuario, int idTema);
}