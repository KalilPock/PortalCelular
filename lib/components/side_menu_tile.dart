import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/pag_inicial');
          },
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.home),
          ),
          title: Text(
            "Página inicial",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/cadastro_laboratorio');
          },
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.build),
          ),
          title: Text(
            "Cadastro Laboratório",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/cadastro_vitrine'); // Adicionando rota para o novo item
          },
          leading: SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.storefront), // Ícone para o novo item
          ),
          title: Text(
            "Cadastro Vitrine", // Texto para o novo item
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
      ],
    );
  }
}
