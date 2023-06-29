import 'package:flutter/material.dart';

import 'EmployeeData.dart';
import 'deals.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EmployeeData(),
      title: 'Flutter Demo',
      theme: ThemeData(),
      // home: dealTable(),
    );
  }
}
