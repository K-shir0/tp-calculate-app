import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
// part 'result_model.g.dart';

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel({
    String id,
    Float tp,
    int perfect,
    int good,
    int bad,
    int miss,
    int blackPerfect,
  }) = _Result;
}
