import 'package:flutter/material.dart';
import 'package:pokemon_app/src/router/routes.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pokémon App',
      routerConfig: router, // Usar el router definido en routes.dart
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}