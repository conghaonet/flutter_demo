import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedContainerDemoPage extends StatefulWidget {
  static const pagePathName = 'animated_container_demo';
  const AnimatedContainerDemoPage({Key? key}) : super(key: key);

  @override
  State<AnimatedContainerDemoPage> createState() => _AnimatedContainerDemoPageState();
}

class _AnimatedContainerDemoPageState extends State<AnimatedContainerDemoPage> {
  Color _color = Colors.blue;
  double _width = 100;
  double _height = 100;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnimatedContainerDemo'),),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () {
          setState(() {
            final random = math.Random();
            _width = random.nextDouble() * 300;
            _height = random.nextDouble() * 300;

            _color = Color.fromARGB(
              255,
              random.nextInt(256), /// Random().nextInt(256); // Value is >= 0 and < 256.
              random.nextInt(256),
              random.nextInt(256),
            );
          });
        },
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          color: _color,
          duration: const Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
        ),
      ),
    );
  }

}
