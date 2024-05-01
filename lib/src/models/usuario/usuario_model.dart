import 'dart:convert';

UsuarioRegistro usuarioRegistroFromJson(String str) =>
    UsuarioRegistro.fromJson(json.decode(str));

String usuarioRegistroToJson(UsuarioRegistro data) =>
    json.encode(data.toJson());

class UsuarioRegistro {
  String nombre;
  String apellido;
  String correo;
  String contrasenaDesencriptada;
  String curso;

  UsuarioRegistro(
      {required this.nombre,
      required this.apellido,
      required this.correo,
      required this.contrasenaDesencriptada,
      required this.curso});

  factory UsuarioRegistro.fromJson(Map<String, dynamic> json) =>
      UsuarioRegistro(
          nombre: json["nombre"],
          apellido: json["apellido"],
          correo: json["correo"],
          contrasenaDesencriptada: json["contrasenaDesencriptada"],
          curso: json["curso"]);

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "contrasenaDesencriptada": contrasenaDesencriptada,
        "curso": curso
      };
}

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  int id;
  String nombre;
  String apellido;
  String correo;

  UsuarioModel({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.correo,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
      };
}

CursoModel cursoModelFromJson(String str) =>
    CursoModel.fromJson(json.decode(str));

String cursoModelToJson(CursoModel data) => json.encode(data.toJson());

class CursoModel {
  final int? id;
  final String? nombre;

  CursoModel({
    this.id,
    this.nombre,
  });

  factory CursoModel.fromJson(Map<String, dynamic> json) => CursoModel(
        id: json["id"],
        nombre: json["nombre"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
      };

  @override
  String toString() {
    return nombre!;
  }
}

EstudianteCursoModel estudianteCursoModelFromJson(String str) => EstudianteCursoModel.fromJson(json.decode(str));

String estudianteCursoModelToJson(EstudianteCursoModel data) => json.encode(data.toJson());

class EstudianteCursoModel {
    final int? id;
    final String? nombre;
    final String? apellido;
    final String? correo;

    EstudianteCursoModel({
        this.id,
        this.nombre,
        this.apellido,
        this.correo,
    });

    factory EstudianteCursoModel.fromJson(Map<String, dynamic> json) => EstudianteCursoModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
    };
}

