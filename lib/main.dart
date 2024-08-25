import 'package:flutter/material.dart';

void main() {
  runApp(const MyContactManagementApp());
}

class MyContactManagementApp extends StatelessWidget {
  const MyContactManagementApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Contact Management System",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: null,
    );
  }
}
