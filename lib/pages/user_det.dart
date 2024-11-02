import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final String userName;
  const UserDetails({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("This is User Details"),
            Text(userName),
          ],
        ),
      ),
    );
  }
}
