import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:uuid/uuid.dart';

class ResultModelFactory {
  static ResultModel create(
      {double tp, perfect, good, bad, miss}) {
    return ResultModel(
        id: Uuid().v4().toString(),
        tp: tp,
        perfect: perfect,
        good: good,
        bad: bad,
        miss: miss);
  }
}
