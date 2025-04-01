import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Styled Text Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextStylingScreen(),
    );
  }
}

class TextStylingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Styled Text Demo')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Large Bold Text',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 10),
            Text(
              'Medium Italic Text',
              style: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                  color: Colors.green),
            ),
            SizedBox(height: 10),
            Text(
              'Small Underlined Text',
              style: TextStyle(
                fontSize: 16,
                decoration: TextDecoration.underline,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Bold ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  'and ',
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
                Text(
                  'Colored Text',
                  style: TextStyle(fontSize: 18, color: Colors.orangeAccent),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
