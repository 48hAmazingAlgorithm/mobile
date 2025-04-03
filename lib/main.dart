import 'package:flutter/material.dart';
import 'package:mobile/clients/clients_page.dart';
import 'package:mobile/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Clients(),
        '/login': (context) => Login(),
      },
    );
  }
}
