import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/historial/historial_model.dart';
import 'package:splitter_web_frontend/src/providers/service_provider.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';

class HistorialPage extends StatefulWidget {
  static const name = "historial-page";
  const HistorialPage({super.key});

  @override
  State<HistorialPage> createState() => _HistorialPageState();
}

class _HistorialPageState extends State<HistorialPage> {
  bool isLoading = true;
  TextEditingController textEditingController = TextEditingController();
  List<HistorialModel> historial = [];
  List<HistorialModel> historialFiltrado = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    final List<HistorialModel> historialLoad = await servicePorvider
        .historialService
        .getHistorial(usuarioProvider.token!);

    setState(() {
      historial = historialLoad;
      historialFiltrado = historialLoad;
      isLoading = false;
    });
  }

  void filtroHistorial(String query) {
    setState(() {
      final cleanQuery = query.trim().toLowerCase();

      historialFiltrado = historial.where((resultado) {
        final tema = getNombreTema(resultado.tema).toLowerCase();
        final anio = resultado.anio.toString();

        return tema.contains(cleanQuery) || anio.contains(cleanQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    return Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Historial'),
          centerTitle: true,
          backgroundColor: rojoColor,
        ),
        body: Column(children: [
          separadorVertical(context, 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 10),
                child: Container(
                  width: 600,
                  height: 50,
                  decoration: BoxDecoration(
                      border: Border.all(color: grisClaColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  child: TextField(
                    style: TextStyle(color: negroColor),
                    controller: textEditingController,
                    onChanged: (value) {
                      filtroHistorial(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      hintStyle: TextStyle(
                        fontFamily: fontApp,
                        fontSize: 16,
                      ),
                      suffixIcon: Icon(Icons.search, color: negroColor),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              separadorHorizontal(context, 10),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: CustomButton(
                    textButton: "Generar reporte anual",
                    widthButton: 300,
                    heightButton: 45,
                    size: mediumSize,
                    color: rojoClaColor,
                    hoverColor: rojoColor,
                    duration: 1000,
                    onTap: () async {
                      final response = await servicePorvider.historialService
                          .generarHistorial(usuarioProvider.token!);
                      showDialog(
                        // ignore: use_build_context_synchronously
                        context: context,
                        builder: (context) => AlertaVolver(
                          width: 200,
                          height: 200,
                          function: () {
                            Navigator.of(context).pop();
                          },
                          widthButton: 10,
                          textoBoton: 'Volver',
                          image: Image.asset(
                              response.type == "OK"
                                  ? 'assets/images/success.png'
                                  : 'assets/images/warning.jpg',
                              height: 80),
                          mensaje: response.msg,
                          dobleBoton: false,
                        ),
                      );

                      loadData();
                    },
                  ),
                ),
              ),
            ],
          ),
          separadorVertical(context, 5),
          isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : tablaHistorial(context, historialFiltrado)
        ]));
  }
}

Widget tablaHistorial(BuildContext context, List<HistorialModel> historial) {
  var media = MediaQuery.of(context).size;

  media =
      (media.width <= 1280) ? Size(media.width * 0.95, media.height) : media;
  media =
      (media.height <= 750) ? Size(media.width, media.height * 0.925) : media;
  media = (media.height <= 580) ? Size(media.width, media.height) : media;
  return Column(
    children: [
      Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: {
          0: FixedColumnWidth(media.width * 40 / 100),
          1: FixedColumnWidth(media.width * 14 / 100),
          2: FixedColumnWidth(media.width * 14 / 100),
        },
        border:
            TableBorder.all(color: Colors.transparent, style: BorderStyle.none),
        children: [
          TableRow(
              decoration: BoxDecoration(
                color: rojoColor,
              ),
              children: [
                Column(children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: texto(
                      "Tema",
                      fontBold,
                      18,
                      blancoColor,
                      TextAlign.end,
                    ),
                  ),
                ]),
                Column(children: [
                  texto(
                    "Puntaje",
                    fontBold,
                    18,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
                Column(children: [
                  texto(
                    "Año",
                    fontBold,
                    18,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
              ]),
        ],
      ),
      SizedBox(
        height: media.height * 65 / 100,
        child: SingleChildScrollView(
          child: Table(
            columnWidths: {
              0: FixedColumnWidth(media.width * 40 / 100),
              1: FixedColumnWidth(media.width * 14 / 100),
              2: FixedColumnWidth(media.width * 14 / 100),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                color: Colors.transparent, style: BorderStyle.none),
            children: [
              for (int index = 0; index < historial.length; index++)
                TableRow(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? rojoColor.withOpacity(0.2)
                          : blancoColor,
                    ),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: texto(
                          getNombreTema(historial[index].tema),
                          fontApp,
                          16,
                          negroColor,
                          TextAlign.center,
                        ),
                      ),
                      Column(children: [
                        texto(
                          historial[index].puntaje.toString(),
                          fontApp,
                          16,
                          negroColor,
                          TextAlign.center,
                        ),
                      ]),
                      Column(children: [
                        texto(
                          historial[index].anio.toString(),
                          fontApp,
                          16,
                          negroColor,
                          TextAlign.center,
                        ),
                      ]),
                    ])
            ],
          ),
        ),
      ),
    ],
  );
}

String getNombreTema(int id) {
  final Map<int, String> mapaTemas = {
    1: "Concepto de fracción",
    2: "Simplificar fracciones",
    3: "Fracciones equivalentes",
    4: "Sumar y restar fracciones",
    5: "Multiplicar y dividir fracciones",
  };
  return mapaTemas[id] ?? "";
}
