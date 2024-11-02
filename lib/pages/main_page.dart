import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Home Page",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            GoRouter.of(context).go("/profile");
          }, 
          child: const Text("go to Profile"),
          ),
            ElevatedButton(onPressed: () {
            GoRouter.of(context).go("/profile/user");
          }, 
          child: const Text("go to nested User"),
          ),
              ElevatedButton(onPressed: () {
            GoRouter.of(context).go("/userdetails", extra: "Ramesh Kaushika");
          }, 
          child: const Text("go to nested User Details"),
          ),
        ],
      ),
    );
  }
}
