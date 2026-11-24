import 'package:flutter/material.dart';
import 'package:southsea_cinema/screens/menu_screen.dart';

void main() {
  runApp(const SouthseaCinemaApp());
}

class SouthseaCinemaApp extends StatelessWidget {
  const SouthseaCinemaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Southsea Cinema',
      home: MenuScreen(),
    );
  }
}
