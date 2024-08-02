import 'package:expense_tracker/models/Expense.dart';
import 'package:flutter/material.dart';

class ExpenseItems extends StatelessWidget {
  const ExpenseItems({super.key, required this.expense});
  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(7, 10, 7, 10),
      child: Card(
        elevation: 5,
        shadowColor: const Color.fromARGB(255, 141, 212, 251),
        //color: const Color.fromARGB(255, 223, 239, 249),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Text(
                      expense.amount.toStringAsFixed(2),
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Icon(CategoryIcons[expense.category]),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          expense.formattedDate,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
