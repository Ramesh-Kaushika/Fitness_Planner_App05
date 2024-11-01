import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  int _counter1 = 0;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter2 = 100;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(
          widget._counter1.toString(),
          style: const TextStyle(
          fontSize: 30,
        ),),
      ),
      floatingActionButton: FloatingActionButton(onPressed: 
      (){
        widget._counter1++;
        _counter2++;
        print(_counter2);
        print(widget._counter1);
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}