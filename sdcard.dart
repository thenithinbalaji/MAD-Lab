<uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyMovieReviewApp());
}

class MyMovieReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
        '/review': (context) => ReviewScreen(),
      },
    );
  }
}

class InputScreen extends StatelessWidget {
  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Review Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: reviewController,
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Enter your movie review'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                await writeReviewToFile(reviewController.text);
                Navigator.pushReplacementNamed(context, '/review');
              },
              child: Text('Submit Review'),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Review'),
      ),
      body: FutureBuilder(
        future: readReviewFromFile(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                snapshot.data ?? 'No review available.',
                style: TextStyle(fontSize: 18.0),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Future<void> writeReviewToFile(String review) async {
  try {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory.path}/movie_review.txt');
    await file.writeAsString(review);
  } catch (e) {
    print('Error writing to file: $e');
  }
}

Future<String> readReviewFromFile() async {
  try {
    final directory = await getExternalStorageDirectory();
    final file = File('${directory.path}/movie_review.txt');
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return 'Error reading the file.';
  }
}
