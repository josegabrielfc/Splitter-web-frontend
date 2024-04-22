import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_web_frontend/src/pages/Admin/admin_page.dart';
import 'package:splitter_web_frontend/src/providers/sidebar_provider.dart';

class AppAdmin extends StatelessWidget {
  static const name = 'admin-page';
  static const String title = 'Admin';
  const AppAdmin({super.key});

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SidebarProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: const AdminPage(),
        ),
      );
}