import 'package:hooks_riverpod/all.dart';
import 'package:tp_calculate/domain/result_repository/model/result_model.dart';

class ResultProvider extends StateNotifier<ResultModel> {
  ResultProvider(ResultModel state) : super(state);


}

final resultNotifierProvider = StateNotifierProvider<ResultProvider>(
  (ref) => ResultProvider(
    ResultModel(),
  ),
);
