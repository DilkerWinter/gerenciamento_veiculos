import 'package:flutter/material.dart';

class AbastecimentoScreen extends StatelessWidget {
  const AbastecimentoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text(
          'Esta é a AbastecimentoScreen',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
