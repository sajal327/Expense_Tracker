import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { food, travel, cinema, work, shopping, leisure }

const CategoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.travel: Icons.flight_takeoff,
  Category.cinema: Icons.movie,
  Category.work: Icons.work_history,
  Category.shopping: Icons.shopping_cart,
};

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  String get formattedDate {
    return formatter.format(date);
  }
}

/*
class ExpenseBucket {
  const ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
*/
class ExpenseBucket {
  final Category category;
  final double totalExpenses;

  ExpenseBucket({required this.category, required this.totalExpenses});

  static ExpenseBucket forCategory(List<Expense> expenses, Category category) {
    final categoryExpenses = expenses
        .where((expense) => expense.category == category)
        .fold(0.0, (sum, item) => sum + item.amount);
    return ExpenseBucket(category: category, totalExpenses: categoryExpenses);
  }
}
