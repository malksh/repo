import 'package:flutter/material.dart';
import 'package:malk_counter/homepage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      title: "ddddd",
      theme: ThemeData(
        primarySwatch: Colors.green,

      ),
      home: const HomePage(),
    );
  }
}