import 'package:flutter/material.dart';
import 'package:gerenciamento_veiculos/Model/Veiculo.dart'; // Importe seu modelo de Veiculo

class VeiculoCard extends StatelessWidget {
  final Veiculo veiculo; 

  const VeiculoCard({super.key, required this.veiculo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), 
      ),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15), 
      child: Padding(
        padding: const EdgeInsets.all(16.0), 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            Text(
              veiculo.nome,
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold, 
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Marca: ${veiculo.marca}',
              style: TextStyle(
                fontSize: 16, 
                color: Colors.grey[700], 
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Ano: ${veiculo.ano}',
              style: TextStyle(
                fontSize: 16, 
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Placa: ${veiculo.placa}',
              style: TextStyle(
                fontSize: 16, 
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
