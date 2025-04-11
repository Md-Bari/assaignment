import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Container Design',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container with Shadow'),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Container background color
              borderRadius: BorderRadius.circular(15), // Rounded corners
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Shadow color
                  blurRadius: 5, // Shadow spread
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(
                color: Colors.white, // Text color
                fontSize: 20, // Text size
                fontWeight: FontWeight.bold, // Text weight
              ),
            ),
          ),
        ),
      ),
    );
  }
}
