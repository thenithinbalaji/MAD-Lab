//Use the same code for To-Do List, jus change the button names

import 'package:flutter/material.dart';

void main() {
  runApp(GroceryApp());
}

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      home: GroceryScreen(),
    );
  }
}

class GroceryScreen extends StatefulWidget {
  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  List<String> groceryList = [];

  TextEditingController itemController = TextEditingController();

  void addItem() {
    String newItem = itemController.text.trim();

    if (newItem.isNotEmpty) {
      setState(() {
        groceryList.add(newItem);
        itemController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: itemController,
              decoration: InputDecoration(
                hintText: 'Enter item...',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: addItem,
              child: Text('Add Item'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Grocery List',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: groceryList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(groceryList[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
