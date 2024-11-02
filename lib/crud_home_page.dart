import 'package:flutter/material.dart';

class CrudHomePage extends StatelessWidget {
  const CrudHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notes"),),
      body: const Column(
        children: [
          Text("first note")
        ],
      ),
    );
  }
}