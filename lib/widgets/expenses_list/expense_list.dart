import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

import 'expense_item.dart';

class expenseList extends StatelessWidget{
  const expenseList({super.key, required this.expenses});
  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
  return ListView.builder( itemCount: expenses.length,itemBuilder: (ctx, index) => expenseItem(expenses[index]) );
  }
}