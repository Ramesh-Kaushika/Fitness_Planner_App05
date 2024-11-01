import 'package:fitness_planner/calculator.dart';
import 'package:fitness_planner/home_page_no_state.dart';
import 'package:fitness_planner/home_page_withState.dart';
import 'package:fitness_planner/pages/main_page.dart';
import 'package:fitness_planner/router/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterClass().router,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     
    );
  }
}

