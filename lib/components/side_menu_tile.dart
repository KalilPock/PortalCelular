import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SideMenuTile extends StatelessWidget {
  const SideMenuTile({super.key});

  Future<void> _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacementNamed(context, '/telaLogin');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro ao fazer logout: $e'),
      ));
    }
  }

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
            Navigator.pushNamed(context, '/cadastro_vitrine');
          },
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.storefront),
          ),
          title: const Text(
            "Cadastro Vitrine",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.pushNamed(context, '/relatorio_laboratorio');
          },
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.document_scanner),
          ),
          title: const Text(
            "Relatórios Laboratório",
            style: TextStyle(color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () => _logout(context),
          leading: const SizedBox(
            height: 34,
            width: 34,
            child: Icon(Icons.logout),
          ),
          title: const Text(
            "Logout",
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
