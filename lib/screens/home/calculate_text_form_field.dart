import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculateTextFormField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter> inputFormatter;
  final Color labelColor;
  final bool isEnabled;
  final Function(String) onSaved;
  final String initialValue;

  const CalculateTextFormField(
      {Key key,
        @required this.label,
        this.inputFormatter,
        this.labelColor,
        this.isEnabled,
        this.onSaved,
        this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(color: labelColor),
          ),
        ),
        TextFormField(
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            border: OutlineInputBorder(),
          ),
          enabled: isEnabled,
          keyboardType: TextInputType.number,
          inputFormatters: inputFormatter,
          onSaved: onSaved,
          initialValue: initialValue,
        ),
      ],
    );
  }
}
