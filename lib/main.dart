import 'package:expences_app/widgets/expense.dart';
import 'package:flutter/material.dart';

var kcolor = ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 96, 59, 181));

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kcolor,
          appBarTheme: AppBarTheme().copyWith(
            backgroundColor: kcolor.onPrimaryContainer,
            foregroundColor: kcolor.primaryContainer,
          )),
      home: Expenses(),
    ),
  );
}

