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
        appBar: AppBar(
          title: const Text('My Sandwich Shop'),
          backgroundColor: Colors.orange,
        ),
        body: const Center(child: OrderItemDisplay(5, 'Footlong')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.shopping_cart),
        ),
      ),
    );
  }
}

class OrderItemDisplay extends StatelessWidget {
  final String itemType;
  final int quantity;

  const OrderItemDisplay(this.quantity, this.itemType, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text('$quantity $itemType sandwich(es): ${'🥪' * quantity}');
  }
}