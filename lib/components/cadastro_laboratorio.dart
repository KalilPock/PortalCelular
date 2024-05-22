import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastroLaboratorio extends StatefulWidget {
  const CadastroLaboratorio({super.key});

  @override
  State<CadastroLaboratorio> createState() => _CadastroLaboratorioState();
}

class _CadastroLaboratorioState extends State<CadastroLaboratorio> {
  final _formKey = GlobalKey<FormState>(); // Chave global para o Form

  final TextEditingController _modeloController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _avaliacaoController = TextEditingController();
  final TextEditingController _vendedorController = TextEditingController();
  final TextEditingController _nomeClienteController = TextEditingController();
  final TextEditingController _telefoneClienteController = TextEditingController();
  final TextEditingController _cpfController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Laboratório'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            print('Back button pressed'); // Adiciona mensagem de depuração
            Navigator.pushReplacementNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associa a chave global ao Form
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
                controller: _precoController,
                decoration: const InputDecoration(labelText: 'Preço de Compra'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o preço de compra';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _avaliacaoController,
                decoration: const InputDecoration(labelText: 'Descrição do aparelho'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a descrição do aparelho';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _vendedorController,
                decoration: const InputDecoration(labelText: 'Vendedor'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o Vendedor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Informações do Cliente:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _nomeClienteController,
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do Cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _telefoneClienteController,
                decoration: const InputDecoration(labelText: 'Número de Telefone'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o telefone do Cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _cpfController,
                decoration: const InputDecoration(labelText: 'CPF'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o CPF do Cliente';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10.0),
              TextFormField(
                controller: _cepController,
                decoration: const InputDecoration(labelText: 'CEP'),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Selecionar Foto'),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Se todos os campos forem válidos, prossegue com o cadastro
                    _botaoCadastroClicado();
                  } else {
                    // Mostrar mensagem de erro se os campos não forem válidos
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Por favor, preencha todos os campos obrigatórios.')),
                    );
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

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
    }
  }

  Future<void> _botaoCadastroClicado() async {
    // Referência ao Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      await firestore.collection('laboratorio').add({
        'modelo': _modeloController.text,
        'preco': double.parse(_precoController.text),
        'avaliacao': _avaliacaoController.text,
        'vendedor': _vendedorController.text,
        'nomeCliente': _nomeClienteController.text,
        'telefoneCliente': _telefoneClienteController.text,
        'cpf': _cpfController.text,
        'cep': _cepController.text,
        'created_at': FieldValue.serverTimestamp(), // Adiciona um timestamp
      });

      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cadastro realizado com sucesso!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Erro ao cadastrar: $e')));
    }
  }
}
