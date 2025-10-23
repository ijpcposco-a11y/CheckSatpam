
import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(const SatpamApp());
}

class SatpamApp extends StatelessWidget {
  const SatpamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Checklist Satpam',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoginPage(),
    );
  }
}
