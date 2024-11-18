import 'package:flutter/material.dart';

class Listaveiculos extends StatelessWidget {
  const Listaveiculos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'Meus Veículos',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
