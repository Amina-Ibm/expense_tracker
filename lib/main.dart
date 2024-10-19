import 'package:flutter/material.dart';
import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.lightGreen);
var dColorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo,
brightness: Brightness.dark);

void main() {
  runApp(
    MaterialApp(

      darkTheme: ThemeData.dark().copyWith(
        colorScheme: dColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          foregroundColor: dColorScheme.onPrimaryContainer,
          backgroundColor: dColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: dColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 8
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: dColorScheme.primaryContainer
            )
      ),
          textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
            ),
          )

      ),

      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          foregroundColor: kColorScheme.onPrimaryContainer,
          backgroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer
          )
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        )
      ),
      themeMode: ThemeMode.dark,
      home: Expenses(),
    ),
  );
}
