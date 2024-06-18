import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';

Widget separadorVertical(BuildContext context, double height) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * height / 100,
  );
}

Widget separadorHorizontal(BuildContext context, double width) {
  return SizedBox(
    width: MediaQuery.of(context).size.width * width / 100,
  );
}

Widget texto(
  String text,
  String font,
  double size,
  Color color,
  TextAlign textalign,
) {
  return SizedBox(
      child: Text(
    text,
    style: TextStyle(
      fontFamily: font,
      fontSize: size,
      color: color,
    ),
    textAlign: textalign,
  ));
}

// ignore: must_be_immutable
class CustomButton extends StatefulWidget {
  final String textButton;
  final double widthButton;
  final double heightButton;
  final double size;
  final Color color;
  final Color hoverColor;
  final int duration; //en milisegundos
  final Icon? icono;
  final Function()? onTap;
  final Image? image;
  late Color? borderColor;
  late Color? textColor;
  late double? sizeBorderRadius;
  CustomButton({
    super.key,
    required this.textButton,
    required this.widthButton,
    required this.heightButton,
    required this.size,
    required this.color,
    required this.hoverColor,
    required this.duration,
    this.icono,
    this.image,
    this.onTap,
    this.borderColor,
    this.textColor,
    this.sizeBorderRadius
  }){
    borderColor = borderColor ?? Colors.transparent;
    textColor = textColor ?? blancoColor;
    sizeBorderRadius = sizeBorderRadius ?? 35.0;
  }

  @override
  // ignore: library_private_types_in_public_api
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      onHover: (bool isHovered) {
        setState(() {
          _isHovered = isHovered;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: widget.duration),
        width: widget.widthButton,
        height: widget.heightButton,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: grisOscColor.withOpacity(0.4),
              spreadRadius: -2,
              blurRadius: 3,
              offset: const Offset(4, 4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(widget.sizeBorderRadius!)),
          border: Border.all(
            color: widget.borderColor!,
            width: (widget.borderColor != null) ? 1.5 : 0,
          ),
          gradient: LinearGradient(
            colors: _isHovered
                ? [
                    Color.lerp(
                        widget.color, widget.color, widget.duration as double)!,
                    Color.lerp(widget.hoverColor, widget.hoverColor,
                        widget.duration as double)!,
                  ]
                : [widget.hoverColor, widget.color],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          widget.icono != null
              ? widget.icono!
              : widget.image != null
                  ? widget.image!
                  : const SizedBox(),
          Text(
            widget.textButton,
            style: TextStyle(
              fontSize: widget.size,
              color: widget.textColor,
              fontFamily: fontBold,
            ),
          ),
        ]),
      ),
    );
  }
}
class AlertaVolver extends StatefulWidget {
  /// Ancho de la ventana de alerta en porcentaje respecto al ancho de la pantalla.
  final double width;

  /// Altura de la ventana de alerta en porcentaje respecto a la altura de la pantalla.
  final double height;

  /// Ancho del botón en porcentaje respecto al ancho de la pantalla.
  final double widthButton;

  final Image image;

  /// Mensaje opcional que se muestra en la ventana de alerta.
  final String? mensaje;

  /// Texto del botón de la ventana de alerta.
  final String textoBoton;

  /// Función que se ejecutará al presionar el botón de la ventana de alerta.
  final Function() function;
  final Function()? functionAceptar;
  final bool? dobleBoton;

  /// Constructor para crear instancias de la clase [Alertas].
  const AlertaVolver({
    super.key,
    required this.width,
    required this.height,
    this.mensaje,
    required this.function,
    required this.widthButton,
    required this.textoBoton,
    required this.image,
    this.functionAceptar,
    this.dobleBoton,
  });

  @override
  State<AlertaVolver> createState() => _AlertaVolverState();
}

class _AlertaVolverState extends State<AlertaVolver> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: blancoColor,
      content: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: blancoColor,
          borderRadius: BorderRadius.circular(
            MediaQuery.of(context).size.width * (widget.width / 100) / 100,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título de la alerta
            widget.image,
            separadorVertical(context, 1),
            // Mensaje opcional de la alerta
            texto(
              widget.mensaje ?? '',
              fontApp,
              16,
              negroColor,
              TextAlign.center,
            ),
            separadorVertical(context, 1),
            // Botón de la alerta
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: widget.function,
                  child: botonCancelar(
                    context,
                    widget.widthButton,
                    5,
                    widget.textoBoton,
                    14,
                  ),
                ),
                widget.dobleBoton == null
                    ? separadorHorizontal(context, 4)
                    : const SizedBox(),
                widget.dobleBoton == null
                    ? InkWell(
                        onTap: widget.functionAceptar,
                        child: botonAceptar(
                          context,
                          widget.widthButton,
                          5,
                          "Aceptar",
                          14,
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget botonCancelar(
    BuildContext context, widthButton, heightButton, textButton, size) {
  return Container(
    width: MediaQuery.of(context).size.width * widthButton / 100,
    height: MediaQuery.of(context).size.height * heightButton / 100,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(color: negroClaColor, width: 1.5)),
    child: Center(
        child: texto(
      textButton,
      fontBold,
      size,
      negroClaColor,
      TextAlign.center,
    )),
  );
}
Widget botonAceptar(
    BuildContext context, widthButton, heightButton, textButton, size,
    [Color? colorBtn]) {
  return Container(
    width: MediaQuery.of(context).size.width * widthButton / 100,
    height: MediaQuery.of(context).size.height * heightButton / 100,
    decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: colorBtn ?? rojoClaColor),
    child: Center(
        child: texto(
      textButton,
      fontApp,
      size,
      blancoColor,
      TextAlign.center,
    )),
  );
}