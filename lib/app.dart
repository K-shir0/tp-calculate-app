import 'package:flutter/material.dart';
import 'package:tp_calculate/screens/example/example.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) => MyApp());
      },
    );
  }
}