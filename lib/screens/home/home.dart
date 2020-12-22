import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TP Calculate")),
      body: Container(
        padding: EdgeInsets.all(16),
        child: CalculateForm(),
      ),
    );
  }
}

// Molecules
// ・有効性の確認
// ・リクエスト等
class CalculateForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalculateTextField(label: "PERFECT"),
          Row(
            children: [
              Expanded(child: CalculateTextField(label: "PERFECT")),
              Expanded(child: CalculateTextField(label: "PERFECT")),
              Expanded(child: CalculateTextField(label: "PERFECT")),
              Expanded(child: CalculateTextField(label: "PERFECT")),
            ],
          )
        ],
      ),
    );
  }
}

// Atoms
class CalculateTextField extends StatelessWidget {
  final String label;
  final bool hasError;

  const CalculateTextField({Key key, this.label, this.hasError}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: new InputDecoration(
        labelText: label,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.red)
        )
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
    );
  }
}
