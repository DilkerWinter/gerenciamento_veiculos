import 'package:firebase_auth/firebase_auth.dart';

class Veiculo {
  final String nome;
  final String marca;
  final String ano;
  final String placa;
  final String usuarioId;

  Veiculo({
    required this.nome,
    required this.marca,
    required this.ano,
    required this.placa,
    required this.usuarioId, 
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'marca': marca,
      'ano': ano,
      'placa': placa,
      'usuarioId': usuarioId, 
    };
  }

  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
      nome: map['nome'],
      marca: map['marca'],
      ano: map['ano'],
      placa: map['placa'],
      usuarioId: map['usuarioId'],
    );
  }
}
