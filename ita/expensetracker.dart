import 'package:flutter/material.dart';

void main() {
  runApp(ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: ExpenseTrackerScreen(),
    );
  }
}

class ExpenseTrackerScreen extends StatefulWidget {
  @override
  _ExpenseTrackerScreenState createState() => _ExpenseTrackerScreenState();
}

class _ExpenseTrackerScreenState extends State<ExpenseTrackerScreen> {
  List<Transaction> transactions = [];

  void addTransaction(String title, double amount) {
    setState(() {
      transactions.add(Transaction(title: title, amount: amount));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TransactionList(transactions: transactions),
          TransactionInput(onSubmit: addTransaction),
        ],
      ),
    );
  }
}

class TransactionInput extends StatelessWidget {
  final Function onSubmit;

  TransactionInput({required this.onSubmit});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(labelText: 'Amount'),
          ),
          ElevatedButton(
            onPressed: () {
              final enteredTitle = titleController.text;
              final enteredAmount = double.parse(amountController.text);

              if (enteredTitle.isNotEmpty && enteredAmount > 0) {
                onSubmit(enteredTitle, enteredAmount);
                titleController.clear();
                amountController.clear();
              }
            },
            child: Text('Add Transaction'),
          ),
        ],
      ),
    );
  }
}

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tx) {
        return Card(
          child: ListTile(
            title: Text(tx.title),
            subtitle: Text('\$${tx.amount.toStringAsFixed(2)}'),
          ),
        );
      }).toList(),
    );
  }
}

class Transaction {
  final String title;
  final double amount;

  Transaction({required this.title, required this.amount});
}
