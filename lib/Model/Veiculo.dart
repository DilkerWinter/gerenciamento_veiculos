class Veiculo {
  String id;
  String nome;
  String marca;
  String ano;
  String placa;
  String usuarioId;
  int kmAtual;
  int? kmAnterior;
  double? mediaConsumo;

  Veiculo({
    required this.id,
    required this.nome,
    required this.marca,
    required this.ano,
    required this.placa,
    required this.usuarioId,
    required this.kmAtual,
    this.kmAnterior,
    this.mediaConsumo,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'marca': marca,
      'ano': ano,
      'placa': placa,
      'usuarioId': usuarioId,
      'kmAtual': kmAtual,
      'kmAnterior': kmAnterior,
      'mediaConsumo': mediaConsumo,
    };
  }

  factory Veiculo.fromMap(Map<String, dynamic> map, String id) {
    return Veiculo(
      id: id,
      nome: map['nome'] ?? '',
      marca: map['marca'] ?? '',
      ano: map['ano'] ?? '',
      placa: map['placa'] ?? '',
      usuarioId: map['usuarioId'] ?? '',
      kmAtual: map['kmAtual'] ?? 0,
      kmAnterior: map['kmAnterior'] != null ? map['kmAnterior'] as int : null,
      mediaConsumo:
          map['mediaConsumo'] != null ? map['mediaConsumo'] as double : null,
    );
  }
}
