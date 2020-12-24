import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
// part 'result_model.g.dart';

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel({
    @nullable
    String id,
    @Default(0)
    double tp,
    @nullable
    int perfect,
    @nullable
    int good,
    @nullable
    int bad,
    @nullable
    int miss,
    @nullable
    int blackPerfect,
  }) = _Result;
}
