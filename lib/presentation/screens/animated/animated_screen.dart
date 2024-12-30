import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color color = Colors.indigo;
  double radius = 10;

  void changeShape() {
    final random = Random();

    setState(() {
      width = random.nextInt(300).toDouble() + 120;
      height = random.nextInt(300).toDouble() + 120;
      color = Color.fromRGBO(
        random.nextInt(255),
        random.nextInt(255),
        random.nextInt(255),
        1
      );
      radius = random.nextInt(100).toDouble() + 100;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
      ),
      body: _AnimatedView(
        height: height,
        width: width,
        color: color,
        radius: radius,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_outlined),
      ),
    );
  }
}

class _AnimatedView extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double radius;
  const _AnimatedView({
    required this.height, 
    required this.width, 
    required this.color, 
    required this.radius
    });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        curve: Curves.easeOutBack,
        duration: const Duration(milliseconds: 500),
        width: width <= 0 ? 0 : width,
        height: height <= 0 ? 0 : height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius < 0 ? 0 : radius),
        ),
      ),
    );
  }
}
