import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_portal_celular/components/side_menu.dart';

class PagInicial extends StatefulWidget {
  const PagInicial({super.key});

  @override
  State<PagInicial> createState() => _PagInicialState();
}

class _PagInicialState extends State<PagInicial> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        drawer: SideBarMenu(),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 11, 89, 255),
        ),
        body: Container(
          color: const Color(0xff17203A),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return;
            },
          ),
        ),
      ),
    );
  }
}
