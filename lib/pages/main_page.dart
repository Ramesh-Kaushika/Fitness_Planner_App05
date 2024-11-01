import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Home Page",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}