import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastroLaboratorio {

  cadastrarLaboratorio({
    required String modelo,
    required double preco,
    required String avaliacao,
    required String vendedor,
    required String nomeCliente,
    required String telefoneCliente,
    required String cpf,
    required String cep,
  }) {
    var modelo;
    var avaliacao;
    var vendedor;
    var cpf;
    if (modelo.isEmpty ||
        avaliacao.isEmpty ||
        vendedor.isEmpty ||
        cpf.isEmpty) {
      var context;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Erro'),
            content: Text('Por favor, preencha todos os campos obrigatórios.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    // Lógica para salvar os dados
  }

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      // Lógica para lidar com a imagem selecionada
    }
  }
}
