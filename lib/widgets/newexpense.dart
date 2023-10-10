import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final TitleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  void dispose() {
    TitleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: TitleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text("Title"),
            ),
          ),
          TextField(
            controller: amountController,
            maxLength: 50,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              label: Text("Amount"),
            ),
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  print(TitleController.text);
                  print(amountController.text);
                },
                child: Text("Save Expense"),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Cancel"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
