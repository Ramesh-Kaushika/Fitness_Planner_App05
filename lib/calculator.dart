import 'package:flutter/material.dart';

class MyCal extends StatefulWidget {
   const MyCal({super.key});

  @override
  State<MyCal> createState() => _MyCalState();
}

class _MyCalState extends State<MyCal> {

//users enterd value
final TextEditingController _oneController = TextEditingController();
final TextEditingController _twoController = TextEditingController();

//result
int _result = 0;

//methods
void add(){
  setState(() {
    
  });
}

@override
  void dispose() {
    // TODO: implement dispose
    _oneController.dispose();
    _twoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cal"), 
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: _oneController,
              decoration: InputDecoration(
                hintText: "Enter First Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(20)
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: _twoController,
              decoration: InputDecoration(
                hintText: "Enter Second Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: const EdgeInsets.all(20)
              ),
            ),
             const SizedBox(
              height: 20,
            ),
            const Text("100",style: TextStyle(
                fontSize: 50
            ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(onPressed: (){},
            child: const Icon(Icons.add),
            ),
            FloatingActionButton(onPressed: (){},
            child: const Icon(Icons.remove),
            ),
            FloatingActionButton(onPressed: (){},
            child: const Text("/"),
            ),
            FloatingActionButton(onPressed: (){},
            child: const Text("X"),
            ),
          ],
        ),
      ),
    );
  }
}