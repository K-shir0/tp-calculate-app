import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/config/palette.dart';
import 'package:tp_calculate/providers/result_provider.dart';

import 'calculate_text_form_field.dart';

class CalculateForm extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final valueTextFormatter = <TextInputFormatter>[
      FilteringTextInputFormatter.digitsOnly
    ];

    final result = useProvider(resultNotifierProvider);
    final _formKey = GlobalKey<FormState>();

    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: CalculateTextFormField(
                    label: "TP値",
                    onSaved: (value) {
                      result.setTp(double.tryParse(value ?? '') ?? 0.0);
                    },
                    initialValue: useProvider(resultNotifierProvider.state)
                        .tp
                        ?.toString() ??
                        "",
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
                  child: CalculateTextFormField(
                    label: "PERFECT",
                    labelColor: Palette.perfect,
                    inputFormatter: valueTextFormatter,
                    onSaved: (value) {
                      result.setPerfect(int.tryParse(value ?? '') ?? 0);
                    },
                    initialValue: useProvider(resultNotifierProvider.state)
                        .perfect
                        ?.toString() ??
                        "",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: CalculateTextFormField(
                    label: "GOOD",
                    labelColor: Palette.good,
                    inputFormatter: valueTextFormatter,
                    onSaved: (value) {
                      result.setGood(int.tryParse(value ?? '') ?? 0);
                    },
                    initialValue: useProvider(resultNotifierProvider.state)
                        .good
                        ?.toString() ??
                        "",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: CalculateTextFormField(
                    label: "BAD",
                    labelColor: Palette.bad,
                    inputFormatter: valueTextFormatter,
                    onSaved: (value) {
                      result.setBad(int.tryParse(value ?? '') ?? 0);
                    },
                    initialValue: useProvider(resultNotifierProvider.state)
                        .bad
                        ?.toString() ??
                        "",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                  child: CalculateTextFormField(
                    label: "MISS",
                    inputFormatter: valueTextFormatter,
                    onSaved: (value) {
                      result.setMiss(int.tryParse(value ?? '') ?? 0);
                    },
                    initialValue: useProvider(resultNotifierProvider.state)
                        .miss
                        ?.toString() ??
                        "",
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
                  /**
                   * 計算ボタン
                   *
                   * 押すとPERFECT(黒)が計算される。
                   */
                  child: RaisedButton(
                    child: Text("計算"),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    textColor: Palette.white,
                    color: Palette.primary,
                    onPressed: () {
                      _formKey.currentState.save();
                      result.calculate();
                    },
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
                    onPressed: () {
                      result.reset();
                    },
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
                  child: CalculateTextFormField(
                    label: "PERFECT(Black)",
                    isEnabled: false,
                    initialValue: useProvider(resultNotifierProvider.state)
                        .blackPerfect
                        ?.toString() ??
                        "",
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