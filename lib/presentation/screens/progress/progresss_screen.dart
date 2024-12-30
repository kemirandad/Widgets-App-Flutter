import 'package:flutter/material.dart';

class ProgresssScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgresssScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Indicadores de progreso'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          Text('Indeterminated Circular Progress'),
          SizedBox(height: 20),
          CircularProgressIndicator(
            strokeWidth: 2,
            color: Colors.purple,
            backgroundColor: Colors.black12,
          ),
          SizedBox(height: 20),
          Text('Controlled Linear an Circular Progress'),
          _ControlledProgressView(),
        ],
      ),
    );
  }
}

class _ControlledProgressView extends StatelessWidget {
  const _ControlledProgressView();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
          return (value * 2) / 100;
        }).takeWhile((value) => value <= 1),
        builder: (context, snapshot) {
          final progressValue = snapshot.data ?? 0;

          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CircularProgressIndicator(
                  value: progressValue,
                  strokeWidth: 2,
                  color: Colors.purple,
                  backgroundColor: Colors.black12,
                ),
                const SizedBox(width: 20),
                Expanded(
                    child: LinearProgressIndicator(
                      value: progressValue,
                      color: Colors.purple,
                      backgroundColor: Colors.black12,
                  ),
                )
              ]),
            ),
          );
        });
  }
}
