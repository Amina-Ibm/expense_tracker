import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import 'expenses_list/expense_list.dart';

class Expenses extends StatefulWidget{
  Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}
class _ExpensesState extends State<Expenses>{
  List<Expense> registeredExpenses = [
    Expense(
      name: 'Flutter course',
      amount: 19,
      date: DateTime.now(),
      category: Category.work
    ),
    Expense(
        name: 'Coco pops',
        amount: 8,
        date: DateTime.now(),
        category: Category.food,
    ),

  ];
  void _openAddExpenseOverlay(){
    showModalBottomSheet(context: context, builder: (ctx) => newExpense());
}

  @override
  Widget build (context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add))
        ],
      ),
      body: Column(
        children: [
          Text('Chart'),
          Expanded(child: expenseList(expenses: registeredExpenses,))
        ],
      ),
    );
  }
}

