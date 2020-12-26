import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model_factory.dart';
import 'package:uuid/uuid.dart';

class ResultNotifier extends StateNotifier<ResultModel> {
  ResultNotifier(ResultModel state) : super(state);

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
  }

  Future<void> postImage(String imageFilePath) async {
    // Base64への変換処理
    File imageFile = new File(imageFilePath);
    List<int> imageBytes = imageFile.readAsBytesSync();
    String base64Image = new Base64Encoder().convert(imageBytes);

    final dio = new Dio();
    final url = DotEnv().env['API_SERVER_URL'];

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
        // Map<String, dynamic> user =;

        final resultJson = json.decode(
          value.toString(),
        );

        resultJson["id"] = Uuid().v4().toString();

        state = ResultModel.fromJson(
            resultJson
        );

        calculate();
      });
    } catch (e) {
      throw e;
    }
  }
}

final resultNotifierProvider = StateNotifierProvider<ResultNotifier>(
  (ref) => ResultNotifier(
    ResultModelFactory().create(),
  ),
);
