import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class expenseList extends StatelessWidget{
  const expenseList({super.key, required this.expenses, required this.onExpenseDismiss});
  final List<Expense> expenses;
  final void Function(Expense expense) onExpenseDismiss;

  @override
  Widget build(BuildContext context) {
  return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error,
          margin: Theme.of(context).cardTheme.margin,
        ),
        onDismissed: (direction){
          onExpenseDismiss(expenses[index]);
        },
          key: ValueKey(expenses[index]),
          child: expenseItem(expenses[index])
      )
  );
  }
}