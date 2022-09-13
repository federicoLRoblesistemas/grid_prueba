import 'package:flutter/material.dart';
import 'package:grid_pluto/src/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pluto Grid',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pluto Grid'),
        ),
        body: const HomePage(),
      ),
    );
  }
}