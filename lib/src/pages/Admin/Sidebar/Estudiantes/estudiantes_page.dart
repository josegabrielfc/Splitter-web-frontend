import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/models/usuario/usuario_model.dart';
import 'package:splitter_web_frontend/src/providers/service_provider.dart';
import 'package:splitter_web_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_web_frontend/src/widgets/inputs.dart';
import 'package:splitter_web_frontend/src/widgets/sidebar_widget.dart';

import '../../../../config/environment/environment.dart';
import '../../../../widgets/widgets_general.dart';

class EstudiantesPage extends StatefulWidget {
  const EstudiantesPage({super.key});
  static const name = 'estudiante-page';

  @override
  State<EstudiantesPage> createState() => _EstudiantesPageState();
}

class _EstudiantesPageState extends State<EstudiantesPage> {
  String _curso = '';
  List<CursoModel> cursos = [];
  List<EstudianteCursoModel> estudiantes = [];

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
    final List<CursoModel> cursoLoad = await servicePorvider.usuarioService
        .cursosByUsuario(usuarioProvider.usuario!.id, usuarioProvider.token!);

    setState(() {
      cursos = cursoLoad;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    return Scaffold(
      drawer: const SidebarWidget(),
      appBar: AppBar(
        title: const Text('Estudiantes'),
        centerTitle: true,
        backgroundColor: rojoColor,
      ),
      body: Center(
        child: SizedBox(
          height: size.height * 0.89,
          width: selectDevice(web: 0.65, cel: 0.94, sizeContext: size.width),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                    final List<EstudianteCursoModel> estudiantesLoad =
                        await servicePorvider.usuarioService
                            .estudiantesByCurso(_curso, usuarioProvider.token!);

                    setState(() {
                      estudiantes = estudiantesLoad;
                    });
                  }),
            ),
            separadorVertical(context, 2),
            tablaHistorial(context, estudiantes)
          ]),
        ),
      ),
    );
  }
}

Widget tablaHistorial(
    BuildContext context, List<EstudianteCursoModel> estudiantes) {
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
          0: FixedColumnWidth(media.width * 20 / 100),
          1: FixedColumnWidth(media.width * 23 / 100),
          2: FixedColumnWidth(media.width * 10 / 100),
          3: FixedColumnWidth(media.width * 15 / 100),
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
                      "Nombre",
                      fontBold,
                      14,
                      blancoColor,
                      TextAlign.end,
                    ),
                  ),
                ]),
                Column(children: [
                  texto(
                    "Correo",
                    fontBold,
                    14,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
                Column(children: [
                  texto(
                    "accion",
                    fontBold,
                    14,
                    blancoColor,
                    TextAlign.end,
                  ),
                ]),
                Column(children: [
                  texto(
                    "accion",
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
              0: FixedColumnWidth(media.width * 20 / 100),
              1: FixedColumnWidth(media.width * 23 / 100),
              2: FixedColumnWidth(media.width * 10 / 100),
              3: FixedColumnWidth(media.width * 15 / 100),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            border: TableBorder.all(
                color: Colors.transparent, style: BorderStyle.none),
            children: [
              for (int index = 0; index < estudiantes.length; index++)
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
                          '${estudiantes[index].nombre!} ${estudiantes[index].apellido!}',
                          fontApp,
                          14,
                          negroColor,
                          TextAlign.center,
                        ),
                      ),
                      Column(children: [
                        texto(
                          estudiantes[index]
                              .correo!, // documentos[index].documentoNombre ??
                          fontApp,
                          14,
                          negroColor,
                          TextAlign.center,
                        ),
                      ]),
                      Column(children: [
                        CustomButton(
                          textButton: "Editar",
                          widthButton: selectDevice(
                              web: 0.05, cel: 0.01, sizeContext: media.width),
                          heightButton: media.height * 0.03,
                          size: mediumSize,
                          color: rojoClaColor,
                          hoverColor: rojoColor,
                          duration: 1000,
                          onTap: () {},
                        ),
                      ]),
                      Column(children: [
                        CustomButton(
                          textButton: "Revisar",
                          widthButton: selectDevice(
                              web: 0.05, cel: 0.01, sizeContext: media.width),
                          heightButton: media.height * 0.03,
                          size: mediumSize,
                          color: rojoClaColor,
                          hoverColor: rojoColor,
                          duration: 1000,
                          onTap: () {},
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
