import 'package:tp_calculate/domain/result_repository/model/result_model.dart';
import 'package:uuid/uuid.dart';

class ResultModelFactory {
  ResultModel create() {
    return ResultModel(id: Uuid().v4().toString());
  }
}
