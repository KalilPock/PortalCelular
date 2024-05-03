import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CadastroLaboratorio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Laboratório'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context,
                '/pag_inicial'); // Função para voltar para a página anterior
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Dados do Celular:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Modelo'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Preço de Compra'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Avaliação do vendedor'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Vendedor  '),
            ),
            SizedBox(height: 20.0),
            Text(
              'Informações do Cliente:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'Número de Telefone'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'CPF'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10.0),
            TextFormField(
              decoration: InputDecoration(labelText: 'CEP'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () =>
                  _pickImage(context), // Chamada para a função _pickImage
              child: Text('Selecionar Foto'), // Texto do botão
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implemente a lógica para salvar os dados do celular e do cliente
              },
              child: Text('Cadastrar'), // Texto do botão
            ),
          ],
        ),
      ),
    );
  }

  // Função para selecionar a imagem
  void _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Aqui você pode lidar com a imagem selecionada, como exibi-la na tela ou salvá-la em algum lugar
      File imageFile = File(pickedFile.path);
      // Adicione a lógica necessária para lidar com a imagem selecionada
    }
  }
}
