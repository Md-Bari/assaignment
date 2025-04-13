import 'package:flutter/material.dart';

void main() => runApp(SideDrawerApp());

class SideDrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Drawer Animation',
      home: CustomDrawerScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CustomDrawerScreen extends StatefulWidget {
  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _drawerSlideAnimation;
  bool _isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    // Animation controller for drawer sliding animation
    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _drawerSlideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleDrawer() {
    setState(() {
      if (_isDrawerOpen) {
        _controller.reverse(); // Close drawer
      } else {
        _controller.forward(); // Open drawer
      }
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Drawer Animation"),
      ),
      body: Stack(
        children: [
          // Main content
          Center(
            child: ElevatedButton(
              onPressed: _toggleDrawer,
              child: Text('Toggle Drawer'),
            ),
          ),
          
          // Drawer with custom slide-in animation
          SlideTransition(
            position: _drawerSlideAnimation,
            child: Container(
              width: 250,
              height: double.infinity,
              color: Colors.blueAccent,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  ListTile(
                    title: Text(
                      'Item 1',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      print('Item 1 clicked');
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Item 2',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      print('Item 2 clicked');
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Item 3',
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      print('Item 3 clicked');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
