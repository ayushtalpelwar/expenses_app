import 'package:expences_app/widgets/expenses_list/expenses_list.dart';
import 'package:expences_app/models/expense_model.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registereExpenses = [
    Expense(
        amount: 450,
        date: DateTime.now(),
        title: "DSA Course",
        category: Category.work),
    Expense(
        amount: 300,
        date: DateTime.now(),
        title: "Movie",
        category: Category.leisure),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => Text("Modal Bottom SHeet"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddExpenseOverlay,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(children: [
        Text("Chart..."),
        Expanded(child: ExpensesList(expenses: _registereExpenses)),
      ]),
    );
  }
}
