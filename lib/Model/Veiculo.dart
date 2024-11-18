class Veiculo {
  String id; 
  String nome;
  String marca;
  String ano;
  String placa;
  String usuarioId;

  Veiculo({
    required this.id,
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

  factory Veiculo.fromMap(Map<String, dynamic> map, String id) {
    return Veiculo(
      id: id,
      nome: map['nome'],
      marca: map['marca'],
      ano: map['ano'],
      placa: map['placa'],
      usuarioId: map['usuarioId'],
    );
  }
}
