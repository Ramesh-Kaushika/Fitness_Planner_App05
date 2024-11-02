import 'package:fitness_planner/crud_home_page.dart';
import 'package:fitness_planner/data/person.dart';
import 'package:fitness_planner/pages/back.dart';
import 'package:fitness_planner/pages/login_page.dart';
import 'package:fitness_planner/pages/main_page.dart';
import 'package:fitness_planner/pages/profile_page.dart';
import 'package:fitness_planner/pages/user_det.dart';
import 'package:fitness_planner/pages/user_page.dart';
import 'package:fitness_planner/router/router_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    errorPageBuilder: (context, state) {
      return const MaterialPage(
        child: Scaffold(
          body: Center(
            child: Text("404 NOT FOUND"),
          ),
        ),
      );
    },
//redirect to login page is ufer is not login
    redirect: (context, state) {
      bool isUserLoggedIn = UserData.isUserLogedIn;

      // Redirect to login page if the user is not logged in and trying to access a restricted page
      if (!isUserLoggedIn && state.uri.toString() != '/login') {
        return '/login';
      }

      // Redirect to home page if the user is logged in and trying to access the login page
      if (isUserLoggedIn && state.uri.toString() == '/login') {
        return '/';
      }

      // Otherwise, allow navigation to the requested route
      return null;
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
        name: RouterNames.profile,
        path: "/profile",
        builder: (context, state) {
          return const ProfilePage();
        },
        routes: [
          //profile/user
          GoRoute(
            name: "user",
            path: "/user",
            builder: (context, state) {
              return const UserPage();
            },
          ),
        ],
      ),
      //parameter passed extra
      // GoRoute(
      //   path: "/userdetails",
      //   builder: (context, state) {
      //     final name = (state.extra as Map<String, dynamic>)["name"] as String;

      //     final ageUser = (state.extra as Map<String, dynamic>)["ageUser"] as int;

      //     return UserDetails(
      //       userName: name,
      //       age: ageUser,
      //     );
      //   },
      // )
      //parameter passed parth
      GoRoute(
        path: "/userdetails/:name/:userAge",
        builder: (context, state) {
          return UserDetails(
            userName: state.pathParameters['name']!,
            age: int.parse(state.pathParameters['userAge']!),
          );
        },
      ),
      GoRoute(
        path: "/login",
        name: RouterNames.login,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: "/back",
        name: RouterNames.back,
        builder: (context, state) {
          return const BackPage();
        },
      ),
       GoRoute(
        path: "/crud",
        name: "crud",
        builder: (context, state) {
          return const CrudHomePage();
        },
      )
    ],
  );
}
