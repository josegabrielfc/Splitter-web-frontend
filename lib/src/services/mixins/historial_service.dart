
import 'package:splitter_web_frontend/src/models/historial/historial_model.dart';

mixin HistorialService {
  Future<List<HistorialModel>> getHistorial(String token);
}