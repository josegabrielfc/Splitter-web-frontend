import 'package:flutter/material.dart';

class TemaProvider with ChangeNotifier {
  // Variable privada para guardar el nombre de la zona común
  String? _nombre;

  // Variable privada para guardar el ID de la zona común
  int? _id;

  // Método getter para acceder al nombre de la zona común
  String? get nombre => _nombre;

  // Método setter para establecer el nombre de la zona común
  set nombre(String? value) {
    _nombre = value;
    notifyListeners();
  }

  // Método getter para acceder al ID de la zona común
  int? get id => _id;

  // Método setter para establecer el ID de la zona común
  set id(int? value) {
    _id = value;
    notifyListeners();
  }
}
// Establecer el nombre e ID de la zona común
//Provider.of<TemaProvider>(context, listen: false).nombre = "Nombre";
//Provider.of<TemaProvider>(context, listen: false).id = "ID";

// Obtener el nombre e ID de la zona común
//String? nombreZonaComun = Provider.of<EstudianteProvider>(context).nombre;
//String? idZonaComun = Provider.of<EstudianteProvider>(context).id;

