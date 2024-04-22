import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/models/sidebar_item.dart';

class SidebarProvider extends ChangeNotifier {
  SidebarItem _sidebarItem = SidebarItem.registrarUsuario;

  SidebarItem get sidebarItem => _sidebarItem;

  void setSidebarItem(SidebarItem sidebarItem) {
    _sidebarItem = sidebarItem;

    notifyListeners();
  }
}
