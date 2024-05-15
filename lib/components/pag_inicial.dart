import 'package:flutter/material.dart';
import 'package:fluuter_portal_celular/components/side_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Importe o pacote do Firestore

class PagInicial extends StatefulWidget {
  const PagInicial({super.key});

  @override
  State<PagInicial> createState() => _PagInicialState();
}

class _PagInicialState extends State<PagInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideBarMenu(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(69, 196, 255, 0.737),
        title: const Text(
          "CristalCell Portal",
        ),
      ),
      body: Container(
        color: const Color(0xff17203A),
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('aparelhos').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Exibe um indicador de carregamento enquanto os dados estão sendo carregados
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, int index) {
                Map<String, dynamic> data = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(data['nome']),
                    subtitle: Text('Preço: \$ ${data['preco']}'),
                    // Exiba outras informações do aparelho aqui
                    onTap: () {
                      // Adicione ação ao clicar no aparelho, se necessário
                    },
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
