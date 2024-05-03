import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluuter_portal_celular/components/info_card.dart';
import 'package:rive/rive.dart';

class SideBarMenu extends StatefulWidget {
  const SideBarMenu({super.key});

  @override
  State<SideBarMenu> createState() => _SideBarMenuState();
}

class _SideBarMenuState extends State<SideBarMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: const Color(0xff17203A),
        child: SafeArea(
          child: Column(
            children: [
              const Infocard(
                name: '',
                profession: '',
              ),
              Column(
                children: [
                  ListTile(
                    onTap: () {},
                    leading: SizedBox(
                      height: 34,
                      width: 34,
                      child: Icon(Icons.home),
                    ),
                    title: Text(
                      "Home",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
