import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/config/environment/environment.dart';
import 'package:splitter_web_frontend/src/models/sidebar_item.dart';
import 'package:splitter_web_frontend/src/models/user.dart';
import 'package:splitter_web_frontend/src/providers/sidebar_provider.dart';
import 'package:splitter_web_frontend/src/widgets/widgets_general.dart';
/*import 'package:selectable_navigation_drawer_example/provider/navigation_provider.dart';*/

class SidebarWidget extends StatelessWidget {
  static const padding = EdgeInsets.symmetric(horizontal: 20);

  const SidebarWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          color: const Color.fromRGBO(142, 142, 142, 1),
          child: ListView(
            children: <Widget>[
              buildHeader(
                context,
                urlImage: urlImage,
                name: name,
                email: email,
              ),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: SidebarItem.registrarUsuario,
                      text: 'Registrar Usuario',
                      icon: Icons.person_add_alt_1,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: SidebarItem.estudiantes,
                      text: 'Estudiantes',
                      icon: Icons.people,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: SidebarItem.workflow,
                      text: 'Workflow',
                      icon: Icons.workspaces_outline,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: SidebarItem.updates,
                      text: 'Updates',
                      icon: Icons.update,
                    ),
                    const SizedBox(height: 24),
                    const Divider(color: Colors.white70),
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: SidebarItem.plugins,
                      text: 'Plugins',
                      icon: Icons.account_tree_outlined,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: SidebarItem.notifications,
                      text: 'Notifications',
                      icon: Icons.notifications_outlined,
                    ),
                  ],
                ),
              ),
              separadorVertical(context, 17),
              buildLogo(context, image: 'images/logo-colegio.png'),
            ],
          ),
        ),
      );

  Widget buildMenuItem(
    BuildContext context, {
    required SidebarItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<SidebarProvider>(context);
    final currentItem = provider.sidebarItem;
    final isSelected = item == currentItem;
    
    final color =  blancoColor;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: rojoClaColor,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  void selectItem(BuildContext context, SidebarItem item) {
    final provider = Provider.of<SidebarProvider>(context, listen: false);
    provider.setSidebarItem(item);
  }

  Widget buildHeader(
    BuildContext context, {
    required String urlImage,
    required String name,
    required String email,
  }) =>
      Material(
        color: Colors.black12,
        child: InkWell(
          onTap: () => selectItem(context, SidebarItem.header),
          child: Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30, backgroundImage: NetworkImage(urlImage)),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(fontSize: 20, color: blancoColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: TextStyle(fontSize: 14, color: blancoColor),
                    ),
                  ],
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 24,
                  backgroundColor: rojoClaColor,
                  child: Icon(Icons.add_comment_outlined, color: blancoColor),
                )
              ],
            ),
          ),
        ),
      );
    
    Widget buildLogo(
    BuildContext context, {
    required String image,
  }) =>
      Material(
        color: const Color.fromRGBO(142, 142, 142, 1),
        child: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.14,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image), fit: BoxFit.scaleDown),
              ),
            ),
          ),
      );
}
