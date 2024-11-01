import 'package:fitness_planner/pages/main_page.dart';
import 'package:go_router/go_router.dart';

class RouterClass {
  final router = GoRouter(
    routes: [
      //Home Page
      GoRoute(path: "/", 
      builder: (context, state){
        return const MainPage();
      },
      )
    ],
  );
}
