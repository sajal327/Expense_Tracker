import 'package:expense_tracker/models/Expense.dart';
import 'package:expense_tracker/widgets/ExpenseList.dart';
import 'package:expense_tracker/widgets/chart.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({
    super.key,
  });

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    // Expense(
    //     title: 'Shopping',
    //     amount: 5000.99,
    //     date: DateTime.now(),
    //     category: Category.work),
    // Expense(
    //     title: 'Cinema',
    //     amount: 399.99,
    //     date: DateTime.now(),
    //     category: Category.cinema),
    // Expense(
    //     title: 'Food',
    //     amount: 1200.99,
    //     date: DateTime.now(),
    //     category: Category.food),
  ];

  void _openAddExpensesOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(
              onAddExpense: _addExpense,
            ));
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense Deleted'),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = Expenselist(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 211, 248, 255),
      appBar: AppBar(
        title: const Text(
          'Expense Tracker',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 21, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 21, 122, 131),
        actions: [
          IconButton(
            onPressed: _openAddExpensesOverlay,
            icon: const Icon(Icons.add),
            color: Colors.white,
            iconSize: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          // const SizedBox(
          //   height: 15,
          // ),
          // const Text(
          //   'The chart',
          //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          // ),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }
}
