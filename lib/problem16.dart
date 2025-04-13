import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(AnimatedContainerApp());

class AnimatedContainerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Container Demo',
      home: AnimatedContainerScreen(),
    );
  }
}

class AnimatedContainerScreen extends StatefulWidget {
  @override
  _AnimatedContainerScreenState createState() => _AnimatedContainerScreenState();
}

class _AnimatedContainerScreenState extends State<AnimatedContainerScreen> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  void _changeContainer() {
    final random = Random();

    setState(() {
      _width = random.nextDouble() * 200 + 100; // 100–300
      _height = random.nextDouble() * 200 + 100; // 100–300
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
      _borderRadius = BorderRadius.circular(random.nextDouble() * 100);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: _borderRadius,
              ),
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _changeContainer,
              child: Text('Animate!'),
            ),
          ],
        ),
      ),
    );
  }
}
