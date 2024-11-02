import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String userName;
  final int age;
  const UserDetails({super.key, required this.userName, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is User Details"),
            Text(userName),
             Text(age.toString()),
          ],
        ),
      ),
    );
  }
}
