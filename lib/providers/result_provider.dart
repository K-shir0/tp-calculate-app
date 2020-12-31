import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model_factory.dart';
import 'package:uuid/uuid.dart';

class ResultNotifier extends StateNotifier<ResultModel> {
  ResultNotifier(ResultModel state) : super(state);

  void reset() {
    state = ResultModelFactory.create();
  }

  void setTp(double value) {
    state = state.copyWith(tp: value);
  }

  void setPerfect(int value) {
    state = state.copyWith(perfect: value);
  }

  void setGood(int value) {
    state = state.copyWith(good: value);
  }

  void setBad(int value) {
    state = state.copyWith(bad: value);
  }

  void setMiss(int value) {
    state = state.copyWith(miss: value);
  }

  void calculate() {
    print("計算開始");
    print(state);

    // 総ノーツ
    int totalNotes = state.perfect + state.good + state.bad + state.miss;
    // 黒パフェ
    int blackPerfect = 0;

    // 計算処理
    blackPerfect = (((100 - state.tp) / (100 / totalNotes) -
                (state.miss + state.bad) -
                (0.7 * state.good)) /
            0.3)
        .round();

    state = state.copyWith(blackPerfect: blackPerfect);

    //TODO データの保存

    state = state.copyWith(id: Uuid().v4().toString());
  }

  Future<void> postImage(String imageFilePath) async {
    // Base64への変換処理
    File imageFile = new File(imageFilePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = new Base64Encoder().convert(imageBytes);

    final dio = new Dio();
    const url = String.fromEnvironment("API_SERVER_URL");

    final payload = {"result_image": base64Image};

    try {
      await dio
          .post(
        url,
        data: payload,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      )
          .then((value) {
        final resultJson = json.decode(
          value.toString(),
        );

        final fromJsonResultModel = ResultModel.fromJson(resultJson);

        state = ResultModelFactory.create(
            tp: fromJsonResultModel.tp,
            perfect: fromJsonResultModel.perfect,
            good: fromJsonResultModel.good,
            bad: fromJsonResultModel.bad,
            miss: fromJsonResultModel.miss);

        calculate();
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }
}

final resultNotifierProvider = StateNotifierProvider<ResultNotifier>(
  (ref) => ResultNotifier(
    ResultModelFactory.create(),
  ),
);
