

import 'package:flutter/material.dart';

class newExpense extends StatefulWidget{

  @override
  State<newExpense> createState() {
    return _newExpenseState();
  }
}
class _newExpenseState extends State<newExpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();


  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextFormField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(
              label: Text('Title')
            ),
          ),
          Row(
            children: [
              TextFormField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Amount')
                ),
              )
            ],
          ),
          Row(
            children: [
              ElevatedButton(onPressed: (){print(_titleController.text);}, child: Text('Add Expense'),),
              ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
            ],
          )
        ],
      ),
    );
  }
}