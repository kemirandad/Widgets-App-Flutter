import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/presentation/providers/counter_provider.dart';
import 'package:myapp/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bodyStyle = Theme.of(context).textTheme.titleLarge;
    final int clickCounter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    final Brightness theme = ref.watch(themeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter Screen'),
          actions: [
            IconButton(
                icon: isDarkMode
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
                onPressed: () {
                  ref
                      .read(isDarkModeProvider.notifier)
                      .update((enabled) => !enabled);
                  theme == Brightness.light
                      ? ref
                          .read(themeProvider.notifier)
                          .update((theme) => theme = Brightness.dark)
                      : ref
                          .read(themeProvider.notifier)
                          .update((theme) => theme = Brightness.light);
                })
          ],
        ),
        body: Center(child: Text('Valor: $clickCounter', style: bodyStyle)),
        floatingActionButton:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            onPressed: () {
              //ref.read(counterProvider.notifier).state++;
              ref.read(counterProvider.notifier).update((crr) => crr + 1);
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state > 0
                    ? ref
                        .read(counterProvider.notifier)
                        .update((crr) => crr - 1)
                    : null;
                //ref.read(counterProvider.notifier).state--;
              },
              child: const Icon(Icons.remove)),
          const SizedBox(height: 10),
          FloatingActionButton(
              onPressed: () {
                ref.refresh(counterProvider.notifier).state;
              },
              child: const Icon(Icons.restart_alt)),
        ]));
  }
}
