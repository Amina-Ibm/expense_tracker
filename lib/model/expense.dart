import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();
enum Category {travel, leisure, food, work}
const CategoryIcon = {
  Category.travel: Icons.travel_explore,
  Category.leisure: Icons.sports_baseball,
  Category.food: Icons.fastfood,
  Category.work: Icons.work
};

class Expense{
  Expense({
    required this.name, required this.amount, required this.date, required this.category
}) : id = uuid.v4();
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Category category;

  String get dateFormatter{
    return formatter.format(date);
  }

}


class ExpenseBucket{
  const ExpenseBucket({ required this.Expenses, required this.category});

  ExpenseBucket.forCategory(
      List<Expense> allExpenses,
      this.category) :Expenses = allExpenses.where(
          (expense) => expense.category == category)
            .toList();
  final Category category;
  final List<Expense> Expenses;


  double get totalExpenses{
    double sum = 0;
    for (var expense in Expenses){
      sum += expense.amount;
    }
    return sum;
  }
}
