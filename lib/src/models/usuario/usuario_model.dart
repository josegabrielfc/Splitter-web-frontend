import 'dart:convert';

UsuarioRegistro usuarioRegistroFromJson(String str) => UsuarioRegistro.fromJson(json.decode(str));

String usuarioRegistroToJson(UsuarioRegistro data) => json.encode(data.toJson());

class UsuarioRegistro {
    String nombre;
    String apellido;
    String correo;
    String contrasenaDesencriptada;

    UsuarioRegistro({
        required this.nombre,
        required this.apellido,
        required this.correo,
        required this.contrasenaDesencriptada,
    });

    factory UsuarioRegistro.fromJson(Map<String, dynamic> json) => UsuarioRegistro(
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
        contrasenaDesencriptada: json["contrasenaDesencriptada"],
    );

    Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
        "contrasenaDesencriptada": contrasenaDesencriptada,
    };
}

UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

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
