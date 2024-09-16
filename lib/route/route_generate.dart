import 'package:brightmain/screens/home.dart';
import 'package:brightmain/screens/welcome.dart';
import 'package:flutter/material.dart';
// import 'package:sqlite/screens/edit_employee_screen.dart';
// import 'package:sqlite/screens/add_employee_screen.dart';
// import 'package:sqlite/screens/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/welcome_page':
        return MaterialPageRoute(builder: (_) => const WelcomePage());
      // case '/edit_employee':
      //   if (args is int) {
      //     return MaterialPageRoute(
      //         builder: (_) => EditEmployeeScreen(
      //               id: args,
      //             ));
      //   }
      // return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Sorrry No Route was Found',
            style: TextStyle(color: Colors.red, fontSize: 18.0),
          ),
        ),
      );
    });
  }
}
