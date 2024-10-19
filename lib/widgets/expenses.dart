import 'package:expense_tracker/widgets/expenses_list/expense_list.dart';
import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:expense_tracker/widgets/chart/chart.dart';
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

    showModalBottomSheet(
      useSafeArea: true,
        isScrollControlled: true,
        context: context, builder: (ctx) => newExpense(onAddExpense: _addExpense,));
}
  void _addExpense(Expense expense){
    setState(() {
      registeredExpenses.add(expense);
    });

  }
  void _removeExpense(Expense expense){
    int expenseIndex = registeredExpenses.indexOf(expense);
    setState(() {
      registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('Expense deleted'),
            duration: Duration(seconds: 2),
          action: SnackBarAction(
              label: 'Undo',
              onPressed: (){
                setState(() {
                  registeredExpenses.insert(expenseIndex, expense);
                });

          }),
        )
    );
  }

  @override
  Widget build (context){
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    Widget mainContent = Center( child: Text('No expenses added'));
    if (registeredExpenses.isNotEmpty){
      mainContent = expenseList(
        expenses: registeredExpenses,
        onExpenseDismiss: _removeExpense,);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add))
        ],
      ),
      body: (width > 600) ?
          Row(
            children: [
              Expanded(child: Chart(expenses: registeredExpenses)) ,
              Expanded(
                  child: mainContent
              )
            ],
          )
      :
      Column(
        children: [
          Chart(expenses: registeredExpenses),
          Expanded(
              child: mainContent
          )
        ],
      ),
    );
  }
}


