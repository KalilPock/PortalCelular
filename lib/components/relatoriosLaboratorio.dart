import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RelatoriosLaboratorio extends StatefulWidget {
  const RelatoriosLaboratorio({super.key});

  @override
  State<RelatoriosLaboratorio> createState() => _RelatoriosLaboratorioState();
}

class _RelatoriosLaboratorioState extends State<RelatoriosLaboratorio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatórios Laboratório'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('laboratorio').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Erro no StreamBuilder: ${snapshot.error}');
            return Center(child: Text('Erro: ${snapshot.error}'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            print('Nenhum dado encontrado na coleção laboratorio');
            return const Center(child: Text('Nenhum relatório encontrado.'));
          }

          print('Dados encontrados: ${snapshot.data!.docs.length} documentos');
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              print('Documento: ${document.id}, Dados: $data');
              return ListTile(
                title: Text(data['modelo'] ?? 'Modelo não especificado'),
                subtitle: Text('Preço: R\$ ${data['preco'] ?? 'N/A'}'),
                onTap: () {
                  // Adicione ação ao clicar no item, se necessário
                },
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
