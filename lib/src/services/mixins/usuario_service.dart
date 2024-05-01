import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';

import '../../models/global_models.dart';

mixin UsuarioService {
  Future<Response> registrarEstudiante(
      UsuarioRegistro usuarioRegistro, String token);

  Future<UsuarioModel> detalleUsuario(String correo, String token);

  Future<Response> cambiarContrasena(int id, String contrasena, String token);

  Future<List<CursoModel>> cursosByUsuario(int usuarioId, String token);

  Future<List<EstudianteCursoModel>> estudiantesByCurso(
      String curso, String token);
}
