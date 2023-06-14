import 'package:flutter/material.dart';
import 'package:insurenceproject/Dashboard.dart';

void main() {
  runApp(const myapp());
}

// ignore: camel_case_types
class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Statless Widget',
      home: Scaffold(
        body: Dashboard(),
      ),
    );
  }
}
