import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tp_calculate/config/palette.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:tp_calculate/providers/result_provider.dart';

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
class CalculateForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final valueTextFormatter = <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ];

    final resultModel = ResultModel();
    final result = useProvider(resultNotifierProvider);

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: CalculateTextField(
                    label: "PERFECT",
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: CalculateTextField(
                    label: "PERFECT",
                    labelColor: Palette.perfect,
                    inputFormatter: valueTextFormatter,
                  ),
                ),
              ),
            ],
          ),

          // ボタン群
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("計算"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    textColor: Palette.white,
                    color: Palette.primary,
                    onPressed: () {},
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton(
                    child: Text("リセット"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: BorderSide(color: Palette.black)),
                    color: Palette.white,
                    onPressed: () {},
                  ),
                ),
              ),

              // ボタン右のスペース
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),

          // 線
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: CalculateTextField(
                    label: "PERFECT",
                  ),
                ),
              ),
              // 右の空白
              Expanded(
                flex: 2,
                child: Container(),
              )
            ],
          ),
        ],
      ),
    );
  }
}

// Atoms
class CalculateTextField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter> inputFormatter;
  final Color labelColor;
  final void Function(String) changed;
  final bool isEnabled;

  const CalculateTextField(
      {Key key,
      @required this.label,
      this.inputFormatter,
      this.labelColor,
      this.changed,
      this.isEnabled})
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
        TextField(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(),
            ),
            enabled: isEnabled,
            onChanged: changed,
            keyboardType: TextInputType.number,
            inputFormatters: inputFormatter),
      ],
    );
  }
}
