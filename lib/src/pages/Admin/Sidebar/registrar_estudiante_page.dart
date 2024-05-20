import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';
import 'package:splitter_web_frontend/src/providers/service_provider.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_web_frontend/src/widgets/inputs.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class RegistrarEstudiantePage extends StatefulWidget {
  static const name = 'registrar-page';
  const RegistrarEstudiantePage({super.key});

  @override
  State<RegistrarEstudiantePage> createState() =>
      _RegistrarEstudiantePageState();
}

class _RegistrarEstudiantePageState extends State<RegistrarEstudiantePage> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerValidatePassword =
      TextEditingController();
  String _curso = '';
  List<CursoModel> cursos = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    final List<CursoModel> cursoLoad = await servicePorvider.usuarioService
        .cursosByUsuario(usuarioProvider.usuario!.id, usuarioProvider.token!);
    setState(() {
      cursos = cursoLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Registro'),
        centerTitle: true,
        backgroundColor: rojoColor,
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
            texto('Registrar estudiante', fontBold, extraBigSize + 2,
                negroColor, TextAlign.justify),
            separadorVertical(context, 3),
            texto('Ingresa los siguientes datos a continuación:', fontMedium,
                bigSize, negroColor, TextAlign.justify),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint:
                    " Nombre completo*, primero los nombres seguido de los apellidos",
                controller: _controllerName,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Email*, ejemplo: correo@gmail.com",
                controller: _controllerEmail,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Contraseña*, minimo 8 caracteres",
                controller: _controllerPassword,
              ),
            ),
            separadorVertical(context, 3),
            Form(
              child: CustomTextFormField(
                sizeBorderRadius: 10,
                hintColor: grisOscColor,
                borderColor: negroClaColor,
                width:
                    selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                height: size.height * 0.05,
                hint: " Confirmar contraseña*, debe ser igual a la contraseña",
                controller: _controllerValidatePassword,
              ),
            ),
            separadorVertical(context, 3),
            SizedBox(
              width: selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
              height: size.height * 0.06,
              child: DropdownBuscador(
                  sizeBorderRadius: 10,
                  hint: " Curso",
                  items: cursos,
                  onChanged: (value) async {
                    setState(() {
                      _curso = value.toString();
                    });
                  }),
            ),
            separadorVertical(context, 4),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  textButton: "Registrar",
                  widthButton: selectDevice(
                      web: 0.2, cel: 0.375, sizeContext: size.width),
                  sizeBorderRadius: 10,
                  heightButton: size.height * 0.06,
                  size: bigSize + 2,
                  color: rojoClaColor,
                  hoverColor: rojoColor,
                  duration: 1000,
                  onTap: () async {
                    if (_controllerName.text.isEmpty ||
                        _controllerEmail.text.isEmpty ||
                        _controllerPassword.text.isEmpty ||
                        _controllerValidatePassword.text.isEmpty ||
                        _curso.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertaVolver(
                          width: 230,
                          height: 200,
                          function: () {
                            Navigator.of(context).pop();
                          },
                          widthButton: 10,
                          textoBoton: 'Volver',
                          image: Image.asset('assets/images/warning.jpg',
                              height: 80),
                          mensaje: "todos los campos son obligatorios.",
                          dobleBoton: false,
                        ),
                      );
                      return;
                    }
                    if (_controllerPassword.text.length < 8) {
                      showDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (context) => AlertaVolver(
                          width: 230,
                          height: 180,
                          function: () {
                            Navigator.of(context).pop();
                          },
                          widthButton: 10,
                          textoBoton: 'Volver',
                          image: Image.asset('assets/images/warning.jpg',
                              height: 80),
                          mensaje:
                              "La contraseña debe tener minimo 8 caracteres.",
                          dobleBoton: false,
                        ),
                      );
                      return;
                    }
                    if (_controllerPassword.text !=
                        _controllerValidatePassword.text) {
                      showDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (context) => AlertaVolver(
                          width: 230,
                          height: 180,
                          function: () {
                            Navigator.of(context).pop();
                          },
                          widthButton: 10,
                          textoBoton: 'Volver',
                          image: Image.asset('assets/images/warning.jpg',
                              height: 80),
                          mensaje: "Las contraseñas no son iguales.",
                          dobleBoton: false,
                        ),
                      );
                      return;
                    }

                    String nombre = '';
                    String apellido = '';
                    String textoNombreCompleto = _controllerName.text.trim();
                    List<String> partesNombre = textoNombreCompleto.split(" ");
                    if (partesNombre.isNotEmpty) {
                      nombre = partesNombre.take(2).join(" ");
                      if (partesNombre.length > 2) {
                        apellido = partesNombre.sublist(2).join(" ");
                      }
                    }
                    UsuarioRegistro usuarioRegistro = UsuarioRegistro(
                        nombre: nombre,
                        apellido: apellido,
                        correo: _controllerEmail.text,
                        contrasenaDesencriptada: _controllerPassword.text,
                        curso: _curso);
                    registrarEstudiante(usuarioRegistro, context);
                  },
                ),
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
                  duration: 1000,
                  onTap: () {
                    setState(() {
                      _controllerName.text = "";
                      _controllerEmail.text = "";
                      _controllerPassword.text = "";
                      _controllerValidatePassword.text = "";
                      _curso = "";
                    });
                  },
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }

  Future<void> registrarEstudiante(
      UsuarioRegistro usuarioRegistro, BuildContext context) async {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);

    final response = await servicePorvider.usuarioService
        .registrarEstudiante(usuarioRegistro, usuarioProvider.token!);

    showDialog(
      // ignore: use_build_context_synchronously
      context: context,
      builder: (context) => AlertaVolver(
        width: 230,
        height: 250,
        function: () {
          if (response.type == "success") {
            setState(() {
              _controllerName.text = "";
              _controllerEmail.text = "";
              _controllerPassword.text = "";
              _controllerValidatePassword.text = "";
              _curso = "";
            });
          }
          Navigator.of(context).pop();
        },
        widthButton: 10,
        textoBoton: 'Volver',
        image: response.type == "success"
            ? Image.asset('assets/images/success.png', height: 80)
            : Image.asset('assets/images/warning.jpg', height: 80),
        mensaje: response.msg,
        dobleBoton: false,
      ),
    );
  }
}
