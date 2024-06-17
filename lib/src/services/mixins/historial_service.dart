
import 'package:splitter_web_frontend/src/models/historial/historial_model.dart';

import '../../models/global_models.dart';

mixin HistorialService {
  Future<List<HistorialModel>> getHistorial(String token);

  Future<Response> generarHistorial(String token);
}