import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluuter_portal_celular/components/side_menu.dart';
import 'package:fluuter_portal_celular/components/telaDetalhesCelular.dart';

class PagInicial extends StatefulWidget {
  const PagInicial({Key? key}) : super(key: key);

  @override
  State<PagInicial> createState() => _PagInicialState();
}

class _PagInicialState extends State<PagInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBarMenu(),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(69, 196, 255, 0.737),
        title: const Text("CristalCell Portal"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF199ad3),
              Color(0xFF1d9bd2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('celulares').snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              print('Erro: ${snapshot.error}');
              return Center(child: Text('Erro: ${snapshot.error}'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('Nenhum aparelho encontrado.'));
            }
            return SingleChildScrollView(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.8,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  DocumentSnapshot celular = snapshot.data!.docs[index];

                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TelaDetalhesCelular(celular: celular),
                        ),
                      );
                    },
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (celular['imagemUrl'] != null)
                              Image.network(
                                celular['imagemUrl'],
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            const SizedBox(height: 8.0),
                            Text(
                              celular['modelo'] ?? 'Sem modelo',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                                'Armazenamento: ${celular['armazenamento'] ?? 'N/A'} GB'),
                            Text(
                                'Memória RAM: ${celular['memoria_ram'] ?? 'N/A'} GB'),
                            Text('Loja: ${celular['loja'] ?? 'N/A'}'),
                            Text(
                                'Preço Mínimo: R\$ ${celular['preco_minimo'] ?? 'N/A'}'),
                            Text(
                                'Preço de Venda: R\$ ${celular['preco_venda'] ?? 'N/A'}'),
                            const SizedBox(height: 4.0),
                            Text(
                              'Descrição: ${celular['avaliacao'] ?? 'Sem descrição'}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Vendedor: ${celular['vendedor'] ?? 'N/A'}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
