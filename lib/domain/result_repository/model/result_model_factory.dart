import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:uuid/uuid.dart';

class ResultModelFactory {
  static ResultModel create(
      {double tp = 0, perfect = 0, good = 0, bad = 0, miss = 0}) {
    return ResultModel(
        id: Uuid().v4().toString(),
        tp: tp,
        perfect: perfect,
        good: good,
        bad: bad,
        miss: miss);
  }
}
