import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TelaDetalhesCelular extends StatelessWidget {
  final DocumentSnapshot celular;

  const TelaDetalhesCelular({super.key, required this.celular});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = celular.data() as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(data['modelo']?? 'Detalhes do Celular'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data['imagemUrl']!= null)
              Image.network(
                data['imagemUrl'],
                height: 200,
                fit: BoxFit.cover,
              ),
            const SizedBox(height: 8.0),
            Text(
              data['modelo']?? 'Sem modelo',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4.0),
            Text('Armazenamento: ${data['armazenamento']?? 'N/A'} GB'),
            Text('Memória RAM: ${data['memoria_ram']?? 'N/A'} GB'),
            Text('Loja: ${data['loja']?? 'N/A'}'),
            Text('Preço Mínimo: R\$ ${data['preco_minimo']?? 'N/A'}'),
            Text('Preço de Venda: R\$ ${data['preco_venda']?? 'N/A'}'),
            const SizedBox(height: 4.0),
            Text(
              'Descrição: ${data['avaliacao']?? 'Sem descrição'}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.0),
            Text(
              'Vendedor: ${data['vendedor']?? 'N/A'}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}