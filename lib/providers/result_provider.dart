import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';

class ResultNotifier extends StateNotifier<ResultModel> {
  ResultNotifier(ResultModel state) : super(state);

  void calculate() {
    int totalNotes = state.perfect + state.good + state.bad + state.miss;
    int blackPerfect = 0;

    // TPが100かどうか
    blackPerfect = (
        (totalNotes * (100 - state.tp)) / 30 - (1 / 3) * (7 * state.good + 10 * (state.miss + state.bad))
    ).round();

    state = state.copyWith( blackPerfect: blackPerfect);

    print(state.blackPerfect);

    //TODO データの保存

    // if (result.tp.toInt() == 100) {
    //   blackPerfect = ((100 - result.tp) / 30 * totalNote).roundToInt()
    // } else {
    //   blackPerfect = (
    //       (totalNote * (100 - result.tp)) / 30 - (1 / 3) * (7 * result.good + 10 * (result.miss + result.bad))
    //   ).roundToInt()
    // }
  }
}

final resultNotifierProvider = StateNotifierProvider<ResultNotifier>(
  (ref) => ResultNotifier(
    ResultModel(tp: 100.toDouble()),
  ),
);
