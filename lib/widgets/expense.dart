import 'package:expences_app/widgets/expenses_list/expenses_list.dart';
import 'package:expences_app/models/expense_model.dart';
import 'package:expences_app/widgets/newexpense.dart';
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
      isScrollControlled: true,
      builder: (ctx) => NewExpense(
        onAddExpense: addExpense,
      ),
    );
  }

  void addExpense(Expense expense) {
    setState(() {
      _registereExpenses.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = _registereExpenses.indexOf(expense);
    setState(() {
      _registereExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();   
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 5),
        content: Text("Expense Deleted."),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registereExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = Center(
      child: Text("No Expense found! Start adding some..."),
    );

    if (_registereExpenses.isNotEmpty) {
      maincontent = ExpensesList(
        expenses: _registereExpenses,
        onremove: removeExpense,
      );
    }
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
        Expanded(child: maincontent),
      ]),
    );
  }
}
