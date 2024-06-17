import 'package:flutter/material.dart';
import 'package:splitter_web_frontend/src/config/helpers/local_storage.dart';

class LogOut extends StatefulWidget {
  const LogOut({super.key});

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _logOut(context));
  }

  Future<void> _logOut(BuildContext context) async {
    await LocalStorage.clearToken();
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, 'login-page', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}