import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroVitrine extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _precoVendaController = TextEditingController();
  final TextEditingController _precoMinimoController = TextEditingController();
  final TextEditingController _lojaController = TextEditingController();
  final TextEditingController _armazenamentoController = TextEditingController();
  final TextEditingController _memoriaRamController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Celulares'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, '/pag_inicial');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Dados do Celular:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _modeloController,
                decoration: InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modelo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _precoVendaController,
                decoration: InputDecoration(labelText: 'Preço de venda'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço de venda';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _precoMinimoController,
                decoration: InputDecoration(labelText: 'Preço mínimo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço mínimo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _lojaController,
                decoration: InputDecoration(labelText: 'Loja'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a loja';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              Text(
                'Informações Técnicas:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _armazenamentoController,
                decoration: InputDecoration(labelText: 'Armazenamento'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o tamanho de Armazenamento';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _memoriaRamController,
                decoration: InputDecoration(labelText: 'Memória Ram'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade de Memoria RAM';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _pickImage(context),
                child: Text('Selecionar Foto'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _cadastrarCelular(context);
                  }
                },
                child: Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pickImage(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  void _cadastrarCelular(BuildContext context) async {
    try {
      await Firebase.initializeApp();
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('celulares').add({
        'modelo': _modeloController.text,
        'preco_venda': _precoVendaController.text,
        'preco_minimo': _precoMinimoController.text,
        'loja': _lojaController.text,
        'armazenamento': _armazenamentoController.text,
        'memoria_ram': _memoriaRamController.text,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Cadastro realizado com sucesso!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao cadastrar: $e')));
    }
  }
}
