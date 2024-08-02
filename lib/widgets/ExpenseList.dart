import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/Expense_items.dart';
import 'package:flutter/material.dart';

class Expenselist extends StatelessWidget {
  const Expenselist(
      {super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (ctx, index) => Dismissible(
            onDismissed: (direction) {
              onRemoveExpense(expenses[index]);
            },
            key: ValueKey(expenses[index]),
            child: ExpenseItems(expense: expenses[index])));
  }
}
