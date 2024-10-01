import 'package:expense_tracker/model/expense.dart';
import 'package:flutter/material.dart';

class expenseItem extends StatelessWidget{
  expenseItem(this.expense, {super.key} );
  final Expense expense;

  @override
  Widget build(BuildContext context){
    return Card(
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 20
      ),
          child: Column(
            children: [
              Text(expense.name),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text('\$${expense.amount.toStringAsFixed(2)}'),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(CategoryIcon[expense.category]),
                      Text(expense.dateFormatter)
                    ],
                  )
                ],
              )
            ],
          ),
    ));

  }
}