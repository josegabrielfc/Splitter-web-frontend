import 'package:splitter_web_frontend/src/models/tema_model.dart';

mixin TemaService {
  Future<List<TemaModel>> listarTemas(String token);
}
