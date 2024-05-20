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
  final TextEditingController _imeiController = TextEditingController();
  final TextEditingController _cpfClienteController = TextEditingController();

  CadastroVitrine({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Celulares'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Dados do Celular:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _modeloController,
                decoration: const InputDecoration(labelText: 'Modelo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o modelo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _precoVendaController,
                decoration: const InputDecoration(labelText: 'Preço de venda'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço de venda';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _precoMinimoController,
                decoration: const InputDecoration(labelText: 'Preço mínimo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço mínimo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _lojaController,
                decoration: const InputDecoration(labelText: 'Loja'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a loja';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Informações Técnicas:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _armazenamentoController,
                decoration: const InputDecoration(labelText: 'Armazenamento'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o tamanho de Armazenamento';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _memoriaRamController,
                decoration: const InputDecoration(labelText: 'Memória Ram'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a quantidade de Memoria RAM';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _imeiController,
                decoration:
                    const InputDecoration(labelText: 'IMEI do Aparelho'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o IMEI do aparelho';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _cpfClienteController,
                decoration: const InputDecoration(labelText: 'CPF do Cliente'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CPF do cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () => _pickImage(context),
                child: const Text('Selecionar Foto'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _cadastrarCelular(context);
                  }
                },
                child: const Text('Cadastrar'),
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
        'imei': _imeiController.text,
        'cpf_cliente': _cpfClienteController.text,

      });
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cadastro realizado com sucesso!')));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao cadastrar: $e')));
    }
  }
}
