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

  List<HistorialModel> historial = [];

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
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SidebarWidget(),
        appBar: AppBar(
          title: const Text('Historial'),
          centerTitle: true,
          backgroundColor: rojoColor,
        ),
        body: Column(children: [
          separadorVertical(context, 5),
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
                onTap: () {},
              ),
            ),
          ),
          separadorVertical(context, 5),
          isLoading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : tablaHistorial(context, historial)
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
                      14,
                      blancoColor,
                      TextAlign.end,
                    ),
                  ),
                ]),
                Column(children: [
                  texto(
                    "Puntaje",
                    fontBold,
                    14,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
                Column(children: [
                  texto(
                    "Año",
                    fontBold,
                    14,
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
                          14,
                          negroColor,
                          TextAlign.center,
                        ),
                      ),
                      Column(children: [
                        texto(
                          historial[index].puntaje.toString(),
                          fontApp,
                          14,
                          negroColor,
                          TextAlign.center,
                        ),
                      ]),
                      Column(children: [
                        texto(
                          historial[index].anio.toString(),
                          fontApp,
                          14,
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
