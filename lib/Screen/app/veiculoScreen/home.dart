import 'package:flutter/material.dart';
import 'package:gerenciamento_veiculos/Screen/app/abastecimentoScreen/abastecimentoScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Variável para controlar o conteúdo exibido
  int _selectedIndex = 0;

  // Método que retorna o conteúdo baseado na seleção do Drawer
  Widget _getBodyContent(int index) {
    switch (index) {
      case 0:
        return Center(child: Text('Tela Início'));
      case 1:
        return const AbastecimentoScreen();
      case 2:
        return Center(child: Text('Tela Configurações'));
      default:
        return Center(child: Text('Tela Início'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Gerenciamento de Veículos',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Início'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.car_repair),
              title: Text('Veículos'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: _getBodyContent(_selectedIndex), // Exibe o conteúdo com base na seleção
    );
  }
}
