import 'dart:convert';

ResultadoformModel resultadoformModelFromJson(String str) => ResultadoformModel.fromJson(json.decode(str));

String resultadoformModelToJson(ResultadoformModel data) => json.encode(data.toJson());

class ResultadoformModel {
    double puntaje;
    int idTema;
    int idUsuario;

    ResultadoformModel({
        required this.puntaje,
        required this.idTema,
        required this.idUsuario,
    });

    factory ResultadoformModel.fromJson(Map<String, dynamic> json) => ResultadoformModel(
        puntaje: json["puntaje"]?.toDouble(),
        idTema: json["idTema"],
        idUsuario: json["idUser"],
    );

    Map<String, dynamic> toJson() => {
        "puntaje": puntaje,
        "idTema": idTema,
        "idUser": idUsuario,
    };
}

ResultadosModel resultadosModelFromJson(String str) => ResultadosModel.fromJson(json.decode(str));

String resultadosModelToJson(ResultadosModel data) => json.encode(data.toJson());

class ResultadosModel {
    double puntaje;
    String username;
    String tema;

    ResultadosModel({
        required this.puntaje,
        required this.username,
        required this.tema,
    });

    factory ResultadosModel.fromJson(Map<String, dynamic> json) => ResultadosModel(
        puntaje: json["puntaje"],
        username: json["username"],
        tema: json["tema"],
    );

    Map<String, dynamic> toJson() => {
        "puntaje": puntaje,
        "username": username,
        "tema": tema,
    };
}

