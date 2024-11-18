import 'package:flutter/material.dart';
import 'package:gerenciamento_veiculos/Model/Veiculo.dart';

void showEditDialog(BuildContext context, Veiculo veiculo, Function(Veiculo) onSave, Function(Veiculo) onDelete) {
  TextEditingController nomeController = TextEditingController(text: veiculo.nome);
  TextEditingController marcaController = TextEditingController(text: veiculo.marca);
  TextEditingController anoController = TextEditingController(text: veiculo.ano);
  TextEditingController placaController = TextEditingController(text: veiculo.placa);

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Editar Veículo'),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: marcaController,
                decoration: InputDecoration(labelText: 'Marca'),
              ),
              TextField(
                controller: anoController,
                decoration: InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: placaController,
                decoration: InputDecoration(labelText: 'Placa'),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              onDelete(veiculo); // Deletar o veículo
              Navigator.of(context).pop(); // Fechar o diálogo
            },
            child: Text('Deletar', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () {
              // Atualizar o veículo com os valores editados
              veiculo.nome = nomeController.text;
              veiculo.marca = marcaController.text;
              veiculo.ano = anoController.text;
              veiculo.placa = placaController.text;

              onSave(veiculo); // Salvar as alterações
              Navigator.of(context).pop(); // Fechar o diálogo
            },
            child: Text('Salvar'),
          ),
        ],
      );
    },
  );
}
