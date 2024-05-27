import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class CadastroLaboratorio {
  // Construtor para inicializar o Firebase
  CadastroLaboratorio() {
    _initializeFirebase();
  }

  // Método para inicializar o Firebase
  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  Future<void> cadastrarLaboratorio({
    required BuildContext context,
    required String modelo,
    required double preco,
    required String avaliacao,
    required String vendedor,
    required String nomeCliente,
    required String telefoneCliente,
    required String cpf,
    required String cep,
  }) async {
    // Validação de campos obrigatórios
    if (modelo.isEmpty || avaliacao.isEmpty || vendedor.isEmpty || cpf.isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro'),
            content: const Text('Por favor, preencha todos os campos obrigatórios.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    try {
      // Referência ao Firestore
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Adicionar documento à coleção 'laboratorios'
      await firestore.collection('laboratorios').add({
        'modelo': modelo,
        'preco': preco,
        'avaliacao': avaliacao,
        'vendedor': vendedor,
        'nomeCliente': nomeCliente,
        'telefoneCliente': telefoneCliente,
        'cpf': cpf,
        'cep': cep,
        'created_at': FieldValue.serverTimestamp(), // Adiciona um timestamp
      });

      // Exibe mensagem de sucesso
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro realizado com sucesso!')));
    } catch (e) {
      // Exibe mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao cadastrar: $e')));
    }
  }

  // Método para selecionar imagem
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile!= null) {
      File imageFile = File(pickedFile.path);
      // Lógica para lidar com a imagem selecionada
    }
  }
}