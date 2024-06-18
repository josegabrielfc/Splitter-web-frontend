import 'dart:convert';

TemaModel temaModelFromJson(String str) => TemaModel.fromJson(json.decode(str));

String temaModelToJson(TemaModel data) => json.encode(data.toJson());

class TemaModel {
  String nombre;
  int id;

  TemaModel({
    required this.nombre,
    required this.id,
  });

  factory TemaModel.fromJson(Map<String, dynamic> json) => TemaModel(
        nombre: json["nombre"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "id": id,
      };
  @override
  String toString() {
    return 'TemaModel{id: $id, nombre: $nombre}';
  }
}
