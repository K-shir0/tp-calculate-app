// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/app.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:tp_calculate/providers/result_provider.dart';
import 'package:tp_calculate/screens/example/example.dart';

void main() {
  group("Result Notifierのテスト", () {
    test("TPの値", () {
      final ResultNotifier resultNotifier = new ResultNotifier(
        ResultModel(tp: 100),
      );

      expect(resultNotifier.debugState.tp, 100);
    });
  });

  test("計算テスト 1", () {
    final ResultNotifier resultNotifier = new ResultNotifier(
      ResultModel(tp: 96.03, perfect: 1601, good: 11, bad: 1, miss: 10),
    );

    resultNotifier.calculate();

    expect(resultNotifier.debugState.blackPerfect, 152);
  });

  test("計算テスト 2", () {
    final ResultNotifier resultNotifier = new ResultNotifier(
      ResultModel(tp: 92.17, perfect: 898, good: 2, bad: 0, miss: 28),
    );

    resultNotifier.calculate();

    expect(resultNotifier.debugState.blackPerfect, 144);
  });
}
