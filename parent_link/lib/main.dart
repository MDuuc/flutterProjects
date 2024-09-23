import 'package:flutter/material.dart';
import 'package:parent_link/pages/login_page.dart';
import 'package:parent_link/pages/open_page.dart';
import 'package:parent_link/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OpenPage(),
      routes: {
        '/open_page': (context) => const OpenPage(),
        '/login_page': (context) => const LoginPage(),
        '/register_page': (context) => const RegisterPage(),


      },
    );
  }
}