import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customized AppBar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Custom background color
        elevation: 4, // Shadow depth
        leading: IconButton(
          icon: Icon(Icons.menu), // Menu icon on the left side
          onPressed: () {
            // Action when the menu icon is pressed
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Menu clicked')),
            );
          },
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png', // Replace with your logo asset
              height: 30, // Adjust height of the logo
              width: 30, // Adjust width of the logo
            ),
            SizedBox(width: 10),
            Text(
              'My App', // App title
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search), // Search icon on the right side
            onPressed: () {
              // Action when the search button is pressed
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Search clicked')),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Welcome to My App!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
