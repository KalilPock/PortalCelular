import 'package:flutter/material.dart';
import 'package:fluuter_portal_celular/components/info_card.dart';

import 'side_menu_tile.dart';

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
        color: Color.fromRGBO(14 , 55, 74, 1),
        child: SafeArea(
          child: Column(
            children: [
              const Infocard(
                name: '',
                profession: '',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
                child: Text(
                  "Browse",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: const Color.fromRGBO(14 , 55, 74, 1),),
                ),
              ),
              const SideMenuTile()
            ],
          ),
        ),
      ),
    );
  }
}
