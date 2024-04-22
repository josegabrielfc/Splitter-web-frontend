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
              color: grisOscColor.withOpacity(0.5),
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