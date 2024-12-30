import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'button_screen';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => context.pop()),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(spacing: 10, alignment: WrapAlignment.center, children: [
          ElevatedButton(
              onPressed: () {}, 
              child: const Text('Elevated Button')),
          const ElevatedButton(
              onPressed: null, 
              child: Text('Elevated Button disabled')),
          ElevatedButton.icon(
            icon: const Icon(Icons.access_alarm_rounded),
            onPressed: () {}, 
            label: const Text('Elevated icon')),
            _CustomButton(),
          FilledButton(onPressed: () {}, 
          child: const Text('Filled Button')),
          OutlinedButton(
              onPressed: () {}, 
              child: const Text('Outlined Button')
              ),
          TextButton(
            onPressed: () {}, 
            child: const Text('Text Button')),
          TextButton.icon(
            onPressed: () {}, 
            icon: const Icon(Icons.business_rounded),
            label: const Text('Text'))
        ]),
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola mundo',
            style: TextStyle(
              color: Colors.white
            ),),
          ),
        ),
      ),
    );
  }
}