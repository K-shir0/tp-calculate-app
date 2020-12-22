import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("TP Calculate")
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            CalculateForm()
          ],
        ),
      ),
    );
  }
}

class CalculateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TPTextField(),
    );
  }

}

class TPTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(labelText: "Enter your number"),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }

}