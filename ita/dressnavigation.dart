import 'package:flutter/material.dart';

void main() {
  runApp(DressApp());
}

class DressApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dress App',
      home: DressListScreen(),
    );
  }
}

class DressListScreen extends StatelessWidget {
  final List<Dress> dresses = [
    Dress(name: 'Casual Dress', description: 'Comfortable and stylish for everyday wear.'),
    Dress(name: 'Formal Dress', description: 'Elegant dress suitable for formal occasions.'),
    Dress(name: 'Party Dress', description: 'Fun and festive dress for parties and events.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dress Types'),
      ),
      body: ListView.builder(
        itemCount: dresses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(dresses[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DressDetailScreen(dress: dresses[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DressDetailScreen extends StatelessWidget {
  final Dress dress;

  DressDetailScreen({required this.dress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dress.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Description:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              dress.description,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Dress {
  final String name;
  final String description;

  Dress({required this.name, required this.description});
}
