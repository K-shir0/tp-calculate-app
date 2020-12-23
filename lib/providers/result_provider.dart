import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';

class ResultNotifier extends StateNotifier<ResultModel> {
  ResultNotifier(ResultModel state) : super(state);

  void calculate() {
    int totalNotes = state.perfect + state.good + state.bad + state.miss;
    int blackPerfect = 0;

    // TPが100かどうか
    blackPerfect = (((100 - state.tp) / (100 / totalNotes) -
                (state.miss + state.bad) -
                (0.7 * state.good)) /
            0.3)
        .round();

    state = state.copyWith(blackPerfect: blackPerfect);

    print(state.blackPerfect);

    //TODO データの保存
  }
}

final resultNotifierProvider = StateNotifierProvider<ResultNotifier>(
  (ref) => ResultNotifier(
    ResultModel(tp: 100.toDouble()),
  ),
);
