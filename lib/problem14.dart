import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe to Reveal Actions',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SwipeListPage(),
    );
  }
}

class SwipeListPage extends StatefulWidget {
  @override
  _SwipeListPageState createState() => _SwipeListPageState();
}

class _SwipeListPageState extends State<SwipeListPage> {
  List<String> items = List.generate(10, (index) => 'Item $index');

  // Function to delete an item from the list
  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  // Function to edit an item (for demonstration purposes)
  void editItem(int index) {
    setState(() {
      items[index] = 'Edited ${items[index]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe to Reveal Actions'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]), // Unique key for each item
            direction: DismissDirection.endToStart, // Swipe direction
            background: Container(
              color: Colors.red, // Background color when swiped
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.green, // Background color when swiped
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                // Swipe for delete action
                return showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Delete Item'),
                      content:
                          Text('Are you sure you want to delete this item?'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            deleteItem(index);
                            Navigator.of(context).pop(true);
                          },
                          child: Text('Delete'),
                        ),
                      ],
                    );
                  },
                );
              }
              return false;
            },
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}
