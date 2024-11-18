import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gerenciamento_veiculos/Model/Veiculo.dart';

class VeiculoController {
  Future<bool> adicionarVeiculo(
      String nome, String marca, String ano, String placa) async {
    User? usuario = FirebaseAuth.instance.currentUser;

    if (usuario != null) {
      try {
        Veiculo veiculo = Veiculo(
          nome: nome,
          marca: marca,
          ano: ano,
          placa: placa,
          usuarioId: usuario.uid,
        );

        await FirebaseFirestore.instance
            .collection('veiculos')
            .add(veiculo.toMap());

        return true;
      } catch (error) {
        print("Erro ao adicionar veículo: $error");
        return false;
      }
    } else {
      return false;
    }
  }

  Future<List<Veiculo>> buscarVeiculosUsuario() async {
    User? usuario = FirebaseAuth.instance.currentUser;

    if (usuario != null) {
      try {
        QuerySnapshot querySnapshot = await FirebaseFirestore.instance
            .collection('veiculos')
            .where('usuarioId', isEqualTo: usuario.uid)
            .get();
        List<Veiculo> veiculos = querySnapshot.docs.map((doc) {
          return Veiculo.fromMap(doc.data() as Map<String, dynamic>);
        }).toList();
        return veiculos;
      } catch (error) {
        print("Erro ao buscar veículos: $error");
        return [];
      }
    } else {
      return [];
    }
  }
}
