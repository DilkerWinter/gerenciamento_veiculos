import 'package:flutter/material.dart';
import 'package:gerenciamento_veiculos/Model/Veiculo.dart';
import 'package:gerenciamento_veiculos/Screen/Gerenciador-Veiculos/veiculoScreen/veiculoCard.dart';
import 'package:gerenciamento_veiculos/controller/VeiculoController.dart';

class Listaveiculos extends StatelessWidget {
  const Listaveiculos({super.key});

  @override
  Widget build(BuildContext context) {
    VeiculoController veiculoController = VeiculoController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: const Text(
                'Meus Veículos',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: FutureBuilder<List<Veiculo>>(
                future: veiculoController.buscarVeiculosUsuario(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Center(child: Text('Erro: ${snapshot.error}'));
                  }

                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('Nenhum veículo encontrado.'));
                  }

                  final veiculos = snapshot.data!;

                  return ListView.builder(
                    itemCount: veiculos.length,
                    itemBuilder: (context, index) {
                      return VeiculoCard(veiculo: veiculos[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
