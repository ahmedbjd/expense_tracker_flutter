import 'package:flutter/material.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpense});
  final List<Expense> expenses;
  final void Function(Expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index].id), 
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.75),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: const Icon(Icons.delete, color: Colors.white, size: 36),
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        },
        child: ExpenseItem(expense: expenses[index])
        ), 
    );
  }
}