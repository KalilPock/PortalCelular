import 'package:flutter/material.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.home),
          ),
          title: const Text(
            "Página inicial",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/cadastro_laboratorio');
          },
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.build),
          ),
          title: const Text(
            "Cadastro Laboratório",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context,
                '/cadastro_vitrine'); // Adicionando rota para o novo item
          },
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.storefront), // Ícone para o novo item
          ),
          title: const Text(
            "Cadastro Vitrine", // Texto para o novo item
            style: TextStyle(color: Colors.white),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Divider(
            color: Colors.white,
            height: 1,
          ),
        ),
      ],
    );
  }
}
