import 'package:flutter/material.dart';

String urlBase = 'http://';

Color rojoColor = const Color.fromARGB(255, 254, 0, 0);
Color rojoClaColor = const Color.fromARGB(255, 252, 70, 70);

Color blancoColor = const Color.fromARGB(255, 255, 255, 255);
Color blancoClaroColor = const Color.fromARGB(218, 255, 255, 255);
Color blancoColorAlpha = const Color.fromARGB(170, 255, 255, 255);
Color blancoColorFondo = const Color.fromARGB(255, 248, 248, 250);

Color negroColor = Colors.black87;
Color negroClaColor = const Color(0xFF5B626B);

Color grisClaColor = const Color(0xFFAAAAAA);
Color grisOscColor = const Color(0xFF6E6E6E);
Color grisClarito = const Color(0xFFD4D4D4);
Color grisColor = const Color.fromRGBO(142, 142, 142, 1);
Color grisClaroColor = const Color.fromRGBO(196, 196, 196, 1);
Color grisTransColor = const Color.fromARGB(255, 235, 235, 235);
Color grisTransColorDeac = const Color.fromARGB(255, 218, 218, 218);
Color inactivoColor = const Color(0xFF8E8E8E);

String fontBold = "PoppinsBold";
String fontExtraBold = "PoppinsExtraBold";
String fontLight = "PoppinsLight";
String fontMedium = "PoppinsMedium";
String fontThin = "PoppinsThin";
String fontApp = "PoppinsRegular";

double smallSize = 12;
double mediumSize = 14;
double bigSize = 16;
double extraBigSize = 24;

double selectDevice({required double web, required double cel, required double sizeContext}) { // size1 = Web | size2 = mobil
  return sizeContext > 1025 ? sizeContext * web : sizeContext * cel;
}
