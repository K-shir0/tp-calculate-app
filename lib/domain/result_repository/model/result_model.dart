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
    @Default(0)
    int perfect,
    @Default(0)
    int good,
    @Default(0)
    int bad,
    @Default(0)
    int miss,
    @Default(0)
    int blackPerfect,
  }) = _Result;
}
