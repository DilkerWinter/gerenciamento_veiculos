import 'package:flutter/material.dart';
import 'package:gerenciamento_veiculos/controller/VeiculoController.dart';  // Certifique-se de importar o controlador

class AdicionarVeiculosScreen extends StatelessWidget {
  const AdicionarVeiculosScreen({super.key});

  // Função para adicionar um veículo de teste
  void adicionarVeiculoDeTeste(BuildContext context) async {
    // Cria o controlador
    VeiculoController controller = VeiculoController();

    bool sucesso = await controller.adicionarVeiculo(
      'Fusca 1978',   // Nome do veículo
      'Volkswagen',   // Marca do veículo
      '1978',         // Ano do veículo
      'ABC1234',      // Placa do veículo
    );

    // Exibe um SnackBar com o resultado
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(sucesso ? 'Veículo adicionado com sucesso!' : 'Erro ao adicionar veículo.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Veículo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0), // Espaçamento ao redor do botão
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Definindo a cor do botão como vermelho
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Tamanho do botão
                  textStyle: const TextStyle(fontSize: 18), // Estilo do texto
                ),
                onPressed: () => adicionarVeiculoDeTeste(context), // Chamando a função ao pressionar o botão
                child: const Text('Adicionar Veículo de Teste'),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento entre o botão e o texto
            const Text(
              "BOTAOOOOOOOOOOOOOOOOOOOOOO",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Estilo do texto
            ),
          ],
        ),
      ),
    );
  }
}
