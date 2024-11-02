import 'package:fitness_planner/pages/main_page.dart';
import 'package:fitness_planner/pages/profile_page.dart';
import 'package:fitness_planner/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterClass {
  final router = GoRouter(
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text("404 NOT FOUND"),
          ),
        ),
      );
    },
    routes: [
      //Home Page
      GoRoute(
        name: "home",
        path: "/",
        builder: (context, state) {
          return const MainPage();
        },
      ),
      //Profile
      GoRoute(
          name: "profile",
          path: "/profile",
          builder: (context, state) {
            return const ProfilePage();
          },
          routes: [
            //profile/user
            GoRoute(
              name: "user",
              path: "user",
              builder: (context, state) {
                return const UserPage();
              },
            )
          ])
    ],
  );
}
