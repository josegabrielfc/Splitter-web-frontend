import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/resultado/resultado_model.dart';
import 'package:splitter_web_frontend/src/models/sidebar_item.dart';
import 'package:splitter_web_frontend/src/providers/estudiante_provider.dart';
import 'package:splitter_web_frontend/src/providers/service_provider.dart';
import 'package:splitter_web_frontend/src/providers/sidebar_provider.dart';
import 'package:splitter_web_frontend/src/providers/tema_provider.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class ResultadoEstudiantesPage extends StatefulWidget {
  const ResultadoEstudiantesPage({super.key});
  static const name = 'resultado-estudiante-page';

  @override
  State<ResultadoEstudiantesPage> createState() =>
      _ResultadoEstudiantesPageState();
}

class _ResultadoEstudiantesPageState extends State<ResultadoEstudiantesPage> {
  String? nombreTema;
  int? idTema;
  String? nombreEstudiante;
  int? idEstudiante;
  List<ResultadosModel> resultados = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EstudianteProvider estudianteProvider =
        Provider.of<EstudianteProvider>(context);
    nombreEstudiante = estudianteProvider.nombre;
    idEstudiante = estudianteProvider.id;
    final TemaProvider temaProvider = Provider.of<TemaProvider>(context);
    nombreTema = temaProvider.nombre;
    idTema = temaProvider.id;
    loadData();
  }

  void loadData() async {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    int usuarioId = usuarioProvider.usuario!.id;
    //int temaId = usuarioProvider.buscarTemaPorNombre(nombreTema!)!;

    final serviceProvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await serviceProvider.resultadoService
        .listarResultados(token, usuarioId, idTema!);
    setState(() {
      resultados = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    //final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    //final servicePorvider = Provider.of<ServicesProvider>(context, listen: false);
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Resultados'),
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
                provider.setSidebarItem(SidebarItem.revisarEstudiante);
              },
              icon: Icon(
                Icons.arrow_back_rounded,
                color: rojoColor,
                size: 50,
              ),
            ),
            SizedBox(
              height: size.height * 0.8,
              width:
                  selectDevice(web: 0.675, cel: 0.94, sizeContext: size.width),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: selectDevice(
                          web: 0.6, cel: 0.8, sizeContext: size.width),
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
                                texto("Unidad: $nombreTema", fontExtraBold,
                                    extraBigSize, negroColor, TextAlign.start),
                                texto(
                                    "Aquí puedes revisar las calificaciones del estudiante",
                                    fontMedium,
                                    bigSize,
                                    negroColor,
                                    TextAlign.start),
                                separadorVertical(context, 4),
                                resultados.isNotEmpty
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: SingleChildScrollView(
                                          child: SizedBox(
                                            width: size.width * 0.725,
                                            height: size.height * 0.56,
                                            child: GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount:
                                                    2, // Number of items in a row
                                                crossAxisSpacing:
                                                    30, // Space between items horizontally
                                                mainAxisSpacing:
                                                    25, // Space between items vertically
                                                childAspectRatio: 3.0,
                                              ),
                                              itemCount: resultados.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Resultado(
                                                    tema:
                                                        resultados[index].tema,
                                                    puntaje: resultados[index]
                                                        .puntaje);
                                              },
                                            ),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
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

class Resultado extends StatelessWidget {
  final String? tema;
  final double? puntaje;
  const Resultado({
    super.key,
    required this.tema,
    required this.puntaje,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blancoColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: grisColor, width: 1.25),
        boxShadow: [
          BoxShadow(
            color: negroColor.withOpacity(0.2),
            spreadRadius: 1.5,
            blurRadius: 2,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                texto("Actividad: $tema", fontExtraBold, bigSize + 2,
                    negroColor, TextAlign.justify),
                separadorVertical(context, 1.5),
                texto("Calificación: $puntaje", fontApp, bigSize, negroColor,
                    TextAlign.justify),
                texto("Preguntas correctas: ${puntaje! / 25}/4", fontApp, bigSize,
                    negroColor, TextAlign.justify),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
