import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int currentMenuIndex = 0;
  
  @override
  Widget build(BuildContext context) {
    bool hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: currentMenuIndex,
      onDestinationSelected: (value) {
        setState(() {
          currentMenuIndex = value;
        });

        final menuItem = menuItems[value];
        context.go(menuItem.route);
        widget.scaffoldKey.currentState?.closeDrawer();

      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 0 : 20, 16, 10),
          child: const Text('Menu'),
        ),
        ...menuItems
        .sublist(0, 3)
        .map((item) {
          return NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          );
        }),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),

        ...menuItems
        .sublist(3)
        .map((item) {
          return NavigationDrawerDestination(
            icon: Icon(item.icon),
            label: Text(item.title),
          );
        }),


    ]);
  }
}