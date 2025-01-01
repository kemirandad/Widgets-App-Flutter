import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myapp/config/menu/menu_items.dart';
import 'package:myapp/presentation/widgets/drawers/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Widgets + Material 3'),
        ),
        drawer: SideMenu(scaffoldKey: scaffoldKey),
        body: _HomeScreen());
  }
}

class _HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Center(
      child: ListView.builder(
          itemCount: menuItems.length,
          itemBuilder: (context, index) {
            final menuItem = menuItems[index];
            return ListTile(
              title: Text(menuItem.title),
              subtitle: Text(menuItem.subTitle),
              leading: Icon(
                menuItem.icon,
                color: color.primary,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                color: color.primary,
              ),
              onTap: () {
                context.push(menuItem.route);
              },
            );
          }),
    );
  }
}
