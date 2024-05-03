import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_portal_celular/components/side_menu.dart';

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
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "CristalCell Portal",
        ),
      ),
      body: Container(
        color: const Color(0xff17203A),
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: 6, // Defina o número de "slots" para os celulares
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text('Celular ${index + 1}'),
                subtitle: Text('Preço: \$ ${1000 + index * 100}'),
                // Adicione outras informações do celular aqui
                onTap: () {
                  // Adicione ação ao clicar no celular, se necessário
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
