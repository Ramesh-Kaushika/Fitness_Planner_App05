import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              "Profile",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(onPressed: () {
            GoRouter.of(context).go("/");
          }, 
          child: const Text("go to Profile"),
          ),
           ElevatedButton(onPressed: () {
            GoRouter.of(context).go("/profile/user");
          }, 
          child: const Text("go to nested User"),
          ),
        ],
      ),
    );
  }
}
