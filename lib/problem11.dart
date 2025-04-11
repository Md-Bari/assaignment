import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assets Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Display Image from Assets'),
        ),
        body: Center(
          child: Image.asset('asset/images/sample_image.jpg'), // Load the image
        ),
      ),
    );
  }
}
