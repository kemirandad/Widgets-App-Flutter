import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Hola mundo'),
        showCloseIcon: true,
        duration: const Duration(milliseconds: 1500),
        closeIconColor: Colors.red,
        action: SnackBarAction(
          label: 'Ok!',
          onPressed: () {},
        ),
      ),
    );
  }

  void _openDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: const Text('¿Estas seguro?'),
                content: const Text('Sainte-viarge de verrat de câlisse de mosus de boswell de patente à gosse de bâtard d\'ostifie de calvaire de maudine.'),
                actions: [
                  TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('Cancelar')),
                  FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Salir'))
                ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () => showAboutDialog(
                        context: context,
                        applicationName: 'Flutter 123',
                        barrierDismissible: false,
                        children: [
                          const Text(
                              'Tabarnane de mautadine de sacristi d\'étole de p\'tit Jésus de sapristi de mautadit de tabarnouche de bâtard de bout d\'ciarge de cibouleau de baptême d\'esprit.')
                        ]),
                child: const Text('Licencias usadas')),
            const SizedBox(height: 20,),
            FilledButton.tonal(
                onPressed: () => _openDialog(context),
                child: const Text('Mostrar diálogo'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
      ),
    );
  }
}
