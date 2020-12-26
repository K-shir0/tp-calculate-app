import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel({
    @Required()
    String id,
    @Default(0)
    @JsonKey(name: "TP")
    double tp,
    @Default(0)
    @JsonKey(name: "PERFECT")
    int perfect,
    @Default(0)
    @JsonKey(name: "GOOD")
    int good,
    @Default(0)
    @JsonKey(name: "BAD")
    int bad,
    @Default(0)
    @JsonKey(name: "MISS")
    int miss,
    @Default(0)
    int blackPerfect,
  }) = _Result;

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
}
