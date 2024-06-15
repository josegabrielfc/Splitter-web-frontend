import 'dart:convert';

HistorialModel historialModelFromJson(String str) => HistorialModel.fromJson(json.decode(str));

String historialModelToJson(HistorialModel data) => json.encode(data.toJson());

class HistorialModel {
    int tema;
    double puntaje;
    int anio;

    HistorialModel({
        required this.tema,
        required this.puntaje,
        required this.anio,
    });

    factory HistorialModel.fromJson(Map<String, dynamic> json) => HistorialModel(
        tema: json["tema"],
        puntaje: json["puntaje"]?.toDouble(),
        anio: json["anio"],
    );

    Map<String, dynamic> toJson() => {
        "tema": tema,
        "puntaje": puntaje,
        "anio": anio,
    };
}
