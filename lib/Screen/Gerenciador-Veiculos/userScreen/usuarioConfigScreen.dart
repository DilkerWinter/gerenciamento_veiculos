import 'package:flutter/material.dart';

class UsuarioConfigScreen extends StatelessWidget {
  const UsuarioConfigScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuração de Usuário'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Esta é a UsuarioConfigScreen',
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
