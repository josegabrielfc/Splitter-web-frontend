import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_web_frontend/src/widgets/inputs.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class HeaderPage extends StatefulWidget {
  static const name = 'header-page';
  const HeaderPage({super.key});

  @override
  State<HeaderPage> createState() => _HeaderPageState();
}

class _HeaderPageState extends State<HeaderPage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerLastname = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerValidatePassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadData();
  }
  void loadData() async {
    final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    _controllerName.text = usuarioProvider.usuario!.nombre;
    _controllerLastname.text = usuarioProvider.usuario!.apellido;
    _controllerEmail.text = usuarioProvider.usuario!.correo;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Perfil'),
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
            separadorVertical(context, 4),
            texto('Perfil profesor', fontBold, extraBigSize + 2,
                negroColor, TextAlign.justify),
            separadorVertical(context, 3),
            texto('Aqui puedes visualizar y editar tus datos:', fontMedium,
                bigSize, negroColor, TextAlign.justify),
            separadorVertical(context, 4),
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
            separadorVertical(context, 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    textButton: "Editar Profesor",
                    widthButton: selectDevice(
                        web: 0.2, cel: 0.375, sizeContext: size.width),
                    sizeBorderRadius: 10,
                    heightButton: size.height * 0.06,
                    size: bigSize + 2,
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
                    size: bigSize + 2,
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
