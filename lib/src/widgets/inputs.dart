import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final double width;
  final double height;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool? readOnly;
  final bool obscureText;
  final Icon? icon;
  final TextEditingController controller;
  final int? sizeMinLines;
  final int? sizeMaxLines;
  final int? sizeMaxLength;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Color? borderColor;
  final Color? hintColor;
  final Color? textColor;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  late Color? errorColor;
  late double? sizeBorderRadius;

  CustomTextFormField(
      {super.key,
      this.label,
      this.hint,
      this.obscureText = false,
      this.onChanged,
      this.validator,
      required this.controller,
      required this.width,
      required this.height,
      this.borderColor,
      this.hintColor,
      this.keyboardType,
      this.readOnly,
      this.icon,
      this.errorMessage,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.errorColor,
      this.textColor,
      this.sizeMinLines,
      this.sizeMaxLines,
      this.sizeMaxLength,
      this.sizeBorderRadius}) {
    errorColor = errorColor ?? rojoColor;
    sizeBorderRadius = sizeBorderRadius ?? 35.0;
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide:
            BorderSide(color: borderColor ?? Colors.transparent, width: 1.75),
        borderRadius: BorderRadius.circular(sizeBorderRadius!));

    return SizedBox(
      width: width,
      child: TextFormField(
        minLines:
            sizeMinLines, //Para aumentar el tamaño vertical del TextFormField
        maxLines:
            sizeMaxLines, //Limitar el tamañao vertical por lineas escritas
        maxLength: sizeMaxLength, //Limitar el tamaño total de palabras
        readOnly: readOnly ?? false,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: TextStyle(
            color: textColor ?? grisColor,
            fontSize: mediumSize,
            fontFamily: fontApp),
        autovalidateMode: autovalidateMode,
        onChanged: onChanged,
        validator: validator,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: readOnly == true ? grisTransColor : blancoColor,
          contentPadding:
              EdgeInsets.symmetric(vertical: height / 2, horizontal: 20),
          isCollapsed: true,
          filled: true,
          enabledBorder: border,
          prefixIcon: icon,
          hintStyle: TextStyle(
            fontFamily: fontApp,
            color: readOnly == true ? grisOscColor : hintColor ?? grisClaColor,
            fontSize: bigSize,
          ),
          focusedBorder: border,
          errorBorder:
              border.copyWith(borderSide: BorderSide(color: errorColor!)),
          focusedErrorBorder:
              border.copyWith(borderSide: BorderSide(color: errorColor!)),
          errorStyle: TextStyle(
            color: errorColor,
            fontFamily: fontApp,
          ),
          label: label != null ? Text(label!) : null,
          hintText: hint,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CustomPassword extends StatefulWidget {
  //Custom TextFormField for Password
  final double width;
  final double height;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Color? borderColor;
  final Color? hintColor;

  final TextEditingController controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  late Color? errorColor;
  late double? sizeBorderRadius;
  late Color? colorIcon;

  CustomPassword(
      {super.key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      required this.controller,
      required this.width,
      required this.height,
      this.borderColor,
      this.hintColor,
      this.autovalidateMode = AutovalidateMode.disabled,
      this.errorColor,
      this.sizeBorderRadius,
      this.colorIcon}) {
    errorColor = errorColor ?? rojoColor;
    sizeBorderRadius = sizeBorderRadius ?? 35.0;
    colorIcon = colorIcon ?? rojoColor;
  }

  @override
  State<CustomPassword> createState() => _CustomPasswordState();
}

class _CustomPasswordState extends State<CustomPassword> {
  bool isEnable = true;
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
        borderSide: BorderSide(
            color: widget.borderColor ?? Colors.transparent, width: 1.75),
        borderRadius: BorderRadius.circular(widget.sizeBorderRadius!));

    return SizedBox(
      width: widget.width,
      child: TextFormField(
        controller: widget.controller,
        autovalidateMode: widget.autovalidateMode,
        onChanged: widget.onChanged,
        validator: widget.validator,
        obscureText: isEnable,
        style: TextStyle(
          fontFamily: fontApp,
          color: widget.hintColor ?? grisClaColor,
          fontSize: mediumSize,
        ),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                vertical: widget.height / 2, horizontal: 20),
            fillColor: blancoColor,
            filled: true,
            enabledBorder: border,
            hintStyle: TextStyle(
                fontFamily: fontApp,
                color: widget.hintColor ?? grisClaColor,
                fontSize: bigSize),
            focusedBorder: border,
            errorBorder: border.copyWith(
                borderSide: BorderSide(color: widget.errorColor!)),
            focusedErrorBorder: border.copyWith(
                borderSide: BorderSide(color: widget.errorColor!)),
            errorStyle: TextStyle(
                color: widget.errorColor,
                fontFamily: fontApp,
                fontSize: bigSize),
            isDense: true,
            label: widget.label != null ? Text(widget.label!) : null,
            hintText: widget.hint,
            errorText: widget.errorMessage,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isEnable = !isEnable;
                });
              },
              icon: Icon(isEnable ? Icons.visibility : Icons.visibility_off),
              color: widget.colorIcon!,
              iconSize: widget.height / 2,
              padding: const EdgeInsets.only(right: 15),
            )),
      ),
    );
  }
}

// ignore: must_be_immutable
class DropdownBuscador<T> extends StatelessWidget {
  final List<T> items;
  final String hint;
  final bool isSearch;
  final bool? readOnly;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  late double? sizeBorderRadius;

  DropdownBuscador(
      {super.key,
      required this.items,
      required this.hint,
      this.isSearch = true,
      this.readOnly = false,
      this.onChanged,
      this.validator,
      this.sizeBorderRadius,}) {
    sizeBorderRadius = sizeBorderRadius ?? 35.0;
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(sizeBorderRadius!),
        borderSide: BorderSide(color: negroClaColor, width: 1.75));
    final labelStyle = TextStyle(
        color: negroClaColor, fontFamily: fontApp, fontSize: mediumSize);
    return DropdownSearch<T>(
      compareFn: (item1, item2) {
        return item1.toString().contains(item2.toString()) ||
            item2.toString().contains(item1.toString());
      },
      validator: validator,
      autoValidateMode: AutovalidateMode.onUserInteraction,
      popupProps: PopupProps.menu(
        containerBuilder: (context, popupWidget) {
          return SizedBox(
            height:
                isSearch ? media.height * 30 / 100 : media.height * 25 / 100,
            child: popupWidget,
          );
        },
        isFilterOnline: false,
        showSelectedItems: true,
        showSearchBox: isSearch,
        searchDelay: Duration.zero,
        itemBuilder: (context, item, isSelected) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              item.toString(),
              style: isSelected
                  ? labelStyle
                  : labelStyle.copyWith(
                      color: negroColor,
                    ),
            ),
          );
        },
        emptyBuilder: (context, searchEntry) {
          return Center(
              child: Text(
            'No hay datos',
            style: labelStyle,
          ));
        },
        searchFieldProps: TextFieldProps(
          decoration: InputDecoration(
              isCollapsed: true,
              contentPadding:
                  const EdgeInsets.only(left: 20, bottom: 10, top: 10),
              border:
                  border.copyWith(borderSide: BorderSide(color: grisClarito)),
              enabledBorder:
                  border.copyWith(borderSide: BorderSide(color: grisClarito)),
              hintText: 'Escribe el nombre',
              hintStyle: labelStyle.copyWith(color: grisClaColor),
              suffixIcon: Icon(
                Icons.search,
                color: grisClaColor,
              )),
        ),
      ),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 20,
          ),
          isCollapsed: true,
          hintText: hint,
          hintStyle: labelStyle,
          border: border,
          labelStyle: labelStyle,
          filled: true,
          fillColor:
              items.isEmpty ? grisClaColor.withOpacity(0.07) : blancoColor,
          errorStyle: labelStyle.copyWith(
            color: rojoColor,
            fontSize: smallSize,
          ),
          errorBorder: border.copyWith(
              borderSide: BorderSide(color: rojoColor, width: 1)),
          enabledBorder: border,
          focusedBorder: border,
        ),
      ),
      dropdownButtonProps: DropdownButtonProps(
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
        ),
        color: items.isEmpty ? grisColor : negroClaColor,
      ),
      dropdownBuilder: (context, selectedItem) {
        return SizedBox(
          height: media.height * 7 / 100,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              selectedItem != null ? selectedItem.toString() : hint,
              style: items.isEmpty
                  ? labelStyle.copyWith(color: grisColor)
                  : labelStyle,
            ),
          ),
        );
      },
      enabled: items.isNotEmpty,
      items: items,
      onChanged: onChanged,
    );
  }
}
