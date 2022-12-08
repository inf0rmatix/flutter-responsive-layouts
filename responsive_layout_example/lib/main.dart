import 'package:flutter/material.dart';
import 'package:responsive_layout_example/responsive_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layouts',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF4D7C8A),
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      home: const ResponsivePage(),
    );
  }
}
