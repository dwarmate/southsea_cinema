import 'package:flutter/material.dart';


void main() {
  runApp(const SouthseaCinemaApp());
}


class SouthseaCinemaApp extends StatelessWidget {
  
    const SouthseaCinemaApp({super.key});

  @override
Widget build(BuildContext context) {
  return MaterialApp(
    title: 'Sandwich Shop App',
    home: Scaffold(
      appBar: AppBar(title: const Text('Sandwich Counter')),
      body: const Center(
        child: Text('Welcome to the Sandwich Shop!'),
      ),
    ),
  );
}

}