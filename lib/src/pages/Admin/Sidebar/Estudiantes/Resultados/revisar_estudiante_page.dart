import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/sidebar_item.dart';
import 'package:splitter_web_frontend/src/models/tema_model.dart';
import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';
import 'package:splitter_web_frontend/src/providers/estudiante_provider.dart';
import 'package:splitter_web_frontend/src/providers/sidebar_provider.dart';
import 'package:splitter_web_frontend/src/providers/tema_provider.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class RevisarEstudiantesPage extends StatefulWidget {
  const RevisarEstudiantesPage({super.key});
  static const name = 'revisar-estudiante-page';

  @override
  State<RevisarEstudiantesPage> createState() => _RevisarEstudiantesPageState();
}

class _RevisarEstudiantesPageState extends State<RevisarEstudiantesPage> {
  List<EstudianteCursoModel> estudiantes = [];
  List<TemaModel> temas = [];
  String? nombreEstudiante;
  int? idEstudiante;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EstudianteProvider estudianteProvider =
        Provider.of<EstudianteProvider>(context);
    nombreEstudiante = estudianteProvider.nombre;
    idEstudiante = estudianteProvider.id;
    loadData();
  }

  void loadData() async {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    //final serviceProvider = Provider.of<ServicesProvider>(context, listen: false);
    //final response = await servicePorvider.temaService.listarTemas(usuarioProvider.token!);
    setState(() {
      temas = usuarioProvider.temas!;
    });
  }

  /*final List<String> _categories = [
    'Concepto de fracción',
    'Simplificar fracciones',
    'Fracciones equivalentes',
    'Sumar y restar fracciones',
    'Multiplicar y dividir fracciones',
  ];*/

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    //final serviceProvider = Provider.of<ServicesProvider>(context, listen: false);
    //int temaId = usuarioProvider.buscarTemaPorNombre("Fracciones equivalentes")!;
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Revisar Estudiante'),
        centerTitle: true,
        backgroundColor: rojoClaColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                final provider =
                    Provider.of<SidebarProvider>(context, listen: false);
                provider.setSidebarItem(SidebarItem.estudiantes);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: rojoColor,
                size: 50,
              ),
            ),
            SizedBox(
              height: size.height * 0.8,
              width: selectDevice(web: 0.625, cel: 0.94, sizeContext: size.width),
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                SizedBox(
                  width: selectDevice(web: 0.6, cel: 0.8, sizeContext: size.width),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      texto("Estudiante: $nombreEstudiante", fontExtraBold,
                          extraBigSize, negroColor, TextAlign.start),
                      separadorVertical(context, 2),
                      Container(
                        height: size.height * 0.7,
                        width: selectDevice(
                            web: 0.65, cel: 0.94, sizeContext: size.width),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: grisColor,
                            width: 1.75,
                          ),
                        ),
                        child: Column(
                          children: [
                            separadorVertical(context, 2.5),
                            texto(
                                "Aquí puedes revisar las calificaciones del estudiante",
                                fontMedium,
                                bigSize,
                                negroColor,
                                TextAlign.start),
                            separadorVertical(context, 4),
                            for (var tema in temas)
                              Column(
                                children: [
                                  CustomButton(
                                      textButton: tema.nombre,
                                      textColor: negroColor,
                                      widthButton: selectDevice(
                                          web: 0.6,
                                          cel: 0.75,
                                          sizeContext: size.width),
                                      sizeBorderRadius: 5,
                                      heightButton: size.height * 0.06,
                                      size: bigSize + 2,
                                      color: blancoColor,
                                      hoverColor: blancoColor,
                                      borderColor: grisColor,
                                      duration: 1000,
                                      onTap: () async {
                                        TemaProvider temaProvider = Provider.of<TemaProvider>(context, listen: false);
                                        temaProvider.nombre = tema.nombre;
                                        temaProvider.id = tema.id;
                                        final provider =
                                            Provider.of<SidebarProvider>(context,
                                                listen: false);
                                        provider.setSidebarItem(
                                            SidebarItem.resultadoEstudiante);
                                      }),
                                  separadorVertical(context, 1.75),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                separadorVertical(context, 2),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
