import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:splitter_web_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/widgets/inputs.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class LoginPage extends StatefulWidget {
  static const name = 'login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final provider = Provider.of<NavigatorProvider>(context);
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/foto-colegio.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent.withOpacity(0.5),
          appBar: AppBar(
            title: const Text('Splitter'),
            backgroundColor: Colors.transparent,
          ),
          body: Center(
            child: Container(
              height: size.height * 0.6,
              width: selectDevice(web: 0.35, cel: 0.875, sizeContext: size.width),
              decoration: BoxDecoration(
                  color: blancoColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  separadorVertical(context, 7.5),
                  texto('¡Bienvenido a Splitter!', fontMedium, extraBigSize + 4,
                      negroColor, TextAlign.justify),
                  separadorVertical(context, 5.5),
                  Form(
                    child: CustomTextFormField(
                      sizeBorderRadius: 10,
                      hintColor: grisOscColor,
                      borderColor: negroClaColor,
                      width: selectDevice(web: 0.24, cel: 0.7, sizeContext: size.width),
                      height: size.height * 0.06,
                      hint: "Email *",
                      controller: _controllerEmail,
                    ),
                  ),
                  separadorVertical(context, 7),
                  Form(
                    child: CustomPassword(
                      sizeBorderRadius: 10,
                      hintColor: grisOscColor,
                      borderColor: negroClaColor,
                      width: selectDevice(web: 0.24, cel: 0.7, sizeContext: size.width),
                      height: size.height * 0.06,
                      hint: "Contraseña *",
                      controller: _controllerPassword,
                    ),
                  ),
                  separadorVertical(context, 7.5),
                  CustomButton(
                      color: rojoColor,
                      hoverColor: rojoClaColor,
                      size: bigSize + 4,
                      textButton: 'Iniciar sesión',
                      heightButton: size.height * 0.065,
                      widthButton: selectDevice(web: 0.22, cel: 0.64, sizeContext: size.width),
                      sizeBorderRadius: 15,
                      duration: 1000,
                      onTap: () {
                          //provider.push(page:"registrar-estudiante");
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
