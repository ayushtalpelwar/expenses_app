import 'package:expences_app/expenses_list.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Text("Chart..."),
          Expanded(child: ExpensesList(expenses: _registereExpenses)),
        ]),
      ),
    );
  }
}
