import 'package:fitness_planner/router/router_names.dart';
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
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).goNamed(RouterNames.profile);
            },
            child: const Text("go to Profile"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).go("/profile/user");
            },
            child: const Text("go to nested User"),
          ),
          ElevatedButton(
            onPressed: () {
              // GoRouter.of(context).go("/userdetails",
              //     extra: {"name": "Ramesh Kaushika", "ageUser": 12,});
              String name = Uri.encodeComponent(
                  "Ramesh Kaushika"); // Encode the name to handle spaces and special characters
              int userAge = 21;

              GoRouter.of(context).go("/userdetails/$name/$userAge");
            },
            child: const Text("go to nested User Details"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/back");
            },
            child: const Text("go to Back Page"),
          ),
          ElevatedButton(
            onPressed: () {
              GoRouter.of(context).push("/crud");
            },
            child: const Text("CRUD"),
          ),
        ],
      ),
    );
  }
}
