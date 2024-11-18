import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gerenciamento_veiculos/Screen/Login-Cadastro/login.dart';

class UsuarioConfigScreen extends StatefulWidget {
  const UsuarioConfigScreen({super.key});

  @override
  _UsuarioConfigScreenState createState() => _UsuarioConfigScreenState();
}

class _UsuarioConfigScreenState extends State<UsuarioConfigScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    User? user = _auth.currentUser;
    if (user != null) {
      emailController.text = user.email ?? '';
      senhaController.text = '';
    }
  }

  void _toggleEdit() {
    setState(() {
      isEditing = !isEditing;
    });
  }

  Future<void> _deleteUser() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        bool shouldDelete = await _showDeleteConfirmation();
        if (shouldDelete) {
          await user.delete();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Usuário excluído com sucesso!'),
          ));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao excluir usuário: $e'),
      ));
    }
  }

  Future<bool> _showDeleteConfirmation() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Excluir Conta'),
            content: Text('Você tem certeza que deseja excluir sua conta?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancelar'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Excluir'),
              ),
            ],
          ),
        ) ??
        false;
  }

  Future<void> _saveChanges() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updateEmail(emailController.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Informações salvas com sucesso!'),
        ));
        _toggleEdit();
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao salvar as informações: $e'),
      ));
    }
  }

  Future<void> _resetPassword() async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _auth.sendPasswordResetEmail(email: user.email!);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Email de redefinição de senha enviado!'),
        ));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao enviar email de redefinição de senha: $e'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    'Configuração de Usuário',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40),
                  Icon(
                    Icons.account_circle,
                    size: 120.0,
                    color: Colors.blue,
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
            Text('Email:', style: TextStyle(fontSize: 18)),
            isEditing
                ? TextField(
                    controller: emailController,
                    decoration:
                        InputDecoration(hintText: 'Digite o novo email'),
                  )
                : Text(
                    emailController.text,
                    style: TextStyle(fontSize: 18),
                  ),
            SizedBox(height: 20),
            Text('Senha:', style: TextStyle(fontSize: 18)),
            Text('******', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _toggleEdit,
                  child: Text(isEditing ? 'Cancelar' : 'Editar'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: isEditing ? _saveChanges : null,
                  child: Text('Salvar'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _deleteUser,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: Text('Excluir Conta',
                      style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _resetPassword,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    'Redefinir Senha',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
