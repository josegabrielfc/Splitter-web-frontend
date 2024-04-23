import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    final String? correo;
    final String? contrasena;

    LoginModel({
        this.correo,
        this.contrasena,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        correo: json["correo"],
        contrasena: json["contrasena"]
    );

    Map<String, dynamic> toJson() => {
        "correo": correo,
        "contrasena": contrasena
    };
}
