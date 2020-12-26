import 'package:flutter/material.dart';
import 'package:tp_calculate/screens/example/example.dart';
import 'package:tp_calculate/screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        // Home
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => HomeScreen());
        }

        return MaterialPageRoute(builder: (context) => MyApp());
      },
    );
  }
}