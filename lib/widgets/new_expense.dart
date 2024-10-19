

import 'package:expense_tracker/model/expense.dart';
import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

import 'expenses_list/expense_item.dart';

class newExpense extends StatefulWidget{


  newExpense({super.key, required this.onAddExpense});
  final void Function(Expense expense) onAddExpense;
  @override
  State<newExpense> createState() {
    return _newExpenseState();
  }
}
class _newExpenseState extends State<newExpense>{
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? pickedDate;
  Category selectedCategory = Category.food;

  void _datePicker() async {
    var now = DateTime.now();
    var first = DateTime(now.year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(context: context, firstDate: first, lastDate: now);
    setState(() {
      pickedDate = selectedDate;
    });
  }
  void validateData(){
    final amountDouble = double.tryParse(_amountController.text);
    bool amountisInvalid(){
      if(amountDouble == null || amountDouble < 0){
        return true;
      } else {
        return false;
      }
    }
    if (_titleController.text.trim().isEmpty || amountisInvalid() || pickedDate == null ){
      showDialog(context: context, builder: (ctx) => AlertDialog(
        title: Text('Invalid data'),
        content: Text('Please make sure you have entered correct expese, amount and date.'),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(ctx);
          }, child: Text('Okay'))
        ],
      )
      );
      return;
    }
    Expense newExpense = Expense(name: _titleController.text, amount: amountDouble!, date: pickedDate!, category: selectedCategory);
    widget.onAddExpense(newExpense);
    Navigator.pop(context);
  }

  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx,  contraints){
      final width = contraints.maxWidth;
      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 25, 20, keyboardHeight + 15),
            child:
            Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: TextFormField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: InputDecoration(
                                label: Text('Title')
                            ),
                          ),
                      ),

                      SizedBox(width: 20,),
                      Expanded(
                        child: TextFormField(
                          controller: _amountController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              prefixText: '\$ ',
                              label: Text('Amount')
                          ),
                        ),
                      ),


                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _titleController,
                          maxLength: 50,
                          decoration: InputDecoration(
                              label: Text('Title')
                          ),
                        ),
                      ),

                    ],
                  ),

                SizedBox(height: 15,),


                if(width >= 600)
                  Row(
                children: [
                  DropdownButton(
                      value: selectedCategory,
                      items:
                      Category.values.map(
                              (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name.toUpperCase(),)
                          )
                      ).toList(),
                      onChanged: (value){
                        if (value == null){
                          return;
                        }
                        setState(() {
                          selectedCategory = value;
                        });

                      }),
                  Spacer(),
                  Text( pickedDate == null ? 'No Date Selected' : formatter.format(pickedDate!)),
                  IconButton(onPressed: _datePicker, icon: Icon(Icons.calendar_month)),

      ],
                )

                      else
                        Row(
                          children: [
                          Expanded(
                          child: TextFormField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                            prefixText: '\$ ',
                            label: Text('Amount')
                            ),
                            ),
                          ),

                          Text( pickedDate == null ? 'No Date Selected' : formatter.format(pickedDate!)),
                          IconButton(onPressed: _datePicker, icon: Icon(Icons.calendar_month))

      ]
      ),
                SizedBox(height: 20,),
                if (width>=600)
                  Row(
                    children: [
                      Spacer(),
                      ElevatedButton(
                        onPressed: (){
                          validateData();
                        },
                        child: Text('Add Expense'),
                      ),
                      SizedBox(width: 5,),
                      ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
                    ],
                  )
                else
                  Row(
                    children: [
                      DropdownButton(
                          value: selectedCategory,
                          items:
                          Category.values.map(
                                  (category) => DropdownMenuItem(
                                  value: category,
                                  child: Text(category.name.toUpperCase(),)
                              )
                          ).toList(),
                          onChanged: (value){
                            if (value == null){
                              return;
                            }
                            setState(() {
                              selectedCategory = value;
                            });

                          }),
                      Spacer(),
                      ElevatedButton(
                        onPressed: (){
                          validateData();
                        },
                        child: Text('Add Expense'),
                      ),
                      SizedBox(width: 5,),
                      ElevatedButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    }
    );

  }
}