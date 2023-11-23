import 'package:flutter/material.dart';

void main() {
  runApp(AlertDialogApp());
}

class AlertDialogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertDialogScreen(),
    );
  }
}

class AlertDialogScreen extends StatelessWidget {
  void _showAlertDialog(BuildContext context) {
    // Use the showDialog function to display the alert dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // Return an AlertDialog widget
        return AlertDialog(
          title: Text('Alert Dialog'),
          content: Text('This is an example of an alert dialog.'),
          actions: [
            // Add an action button to close the dialog
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog App'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showAlertDialog(context); // Show the alert dialog
          },
          child: Text('Show Alert Dialog'),
        ),
      ),
    );
  }
}
