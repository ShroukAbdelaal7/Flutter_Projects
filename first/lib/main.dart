import 'package:first/gradient_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GradientContainer([
          Color.fromARGB(255, 255, 254, 184),
          Color.fromARGB(255, 0, 0, 0),
        ]),
      ),
    );
  }
}
