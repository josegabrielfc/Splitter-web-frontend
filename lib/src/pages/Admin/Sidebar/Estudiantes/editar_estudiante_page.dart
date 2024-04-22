import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/widgets/inputs.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class EditarEstudiantePage extends StatefulWidget {
  const EditarEstudiantePage({super.key});

  @override
  State<EditarEstudiantePage> createState() => _EditarEstudiantePageState();
}

class _EditarEstudiantePageState extends State<EditarEstudiantePage> {
  final TextEditingController _controllerName = TextEditingController(text: "Salomón");
  final TextEditingController _controllerLastname = TextEditingController(text: "Duarte Fuentes");
  final TextEditingController _controllerEmail = TextEditingController(text: "salodufu@gmail.com");
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerValidatePassword = TextEditingController();
  final TextEditingController _controllerCurso = TextEditingController(text: "Curso 3");

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Editar'),
        centerTitle: true,
        backgroundColor: rojoClaColor,
      ),
      body: Center(
        child: Container(
          height: size.height * 0.89,
          width: selectDevice(web: 0.65, cel: 0.94, sizeContext: size.width),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: grisColor,
              width: 1.75,
            ),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            separadorVertical(context, 3),
            texto('Editar estudiante', fontBold, extraBigSize + 2,
                negroColor, TextAlign.justify),
            separadorVertical(context, 3),
            texto('Aqui puedes visualizar y editar datos de un estudiante:', fontMedium,
                bigSize - 2, negroColor, TextAlign.justify),
            separadorVertical(context, 2),
            Form(
              child: CustomTextFormField(
                readOnly: true,
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Nombres*",
                controller: _controllerName,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                readOnly: true,
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Apellidos*",
                controller: _controllerLastname,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                readOnly: true,
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Email*",
                controller: _controllerEmail,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomPassword(
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Contraseña*",
                controller: _controllerPassword,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomPassword(
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Confirma Contraseña*",
                controller: _controllerValidatePassword,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                readOnly: true,
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Curso*",
                controller: _controllerCurso,
              ),
            ),
            separadorVertical(context, 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    textButton: "Editar Estudiante",
                    widthButton: selectDevice(
                        web: 0.2, cel: 0.375, sizeContext: size.width),
                    sizeBorderRadius: 10,
                    heightButton: size.height * 0.06,
                    size: bigSize,
                    color: rojoClaColor,
                    hoverColor: rojoColor,
                    duration: 1000),
                separadorHorizontal(context, 2.5),
                CustomButton(
                    textButton: "Cancelar",
                    widthButton: selectDevice(
                        web: 0.2, cel: 0.375, sizeContext: size.width),
                    sizeBorderRadius: 10,
                    heightButton: size.height * 0.06,
                    size: bigSize,
                    color: grisColor,
                    hoverColor: grisOscColor,
                    duration: 1000),
              ],
            )
          ]),
        ),
      ),
    );
  }
}