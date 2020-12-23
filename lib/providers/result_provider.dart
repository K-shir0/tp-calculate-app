import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';

class ResultNotifier extends StateNotifier<ResultModel> {
  ResultNotifier(ResultModel state) : super(state);

  void calculate() {
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
}

final resultNotifierProvider = StateNotifierProvider<ResultNotifier>(
  (ref) => ResultNotifier(
    ResultModel(),
  ),
);
