import 'package:flutter/material.dart';
import 'package:ne_kidaem_test/ui/login/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kanban',
      theme: ThemeData.dark(),
      home: LoginPage(title: 'Kanban'),
    );
  }
}