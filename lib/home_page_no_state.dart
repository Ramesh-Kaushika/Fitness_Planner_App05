
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   HomePage({super.key});

  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  Center(
      child: Text(_counter.toString(), style: const TextStyle(
          fontSize: 30,
      ),
      ),
     ),
     floatingActionButton: FloatingActionButton(
      onPressed: (){
        _counter++;
          print(_counter);
      },
      child: const Icon(Icons.add),
      ),
    );
  }
}