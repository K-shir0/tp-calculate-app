import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_model.freezed.dart';
part 'result_model.g.dart';

@freezed
abstract class ResultModel with _$ResultModel {
  const factory ResultModel({
    @nullable
    String id,
    @nullable
    @JsonKey(name: "TP")
    double tp,
    @nullable
    @JsonKey(name: "PERFECT")
    int perfect,
    @nullable
    @JsonKey(name: "GOOD")
    int good,
    @nullable
    @JsonKey(name: "BAD")
    int bad,
    @nullable
    @JsonKey(name: "MISS")
    int miss,
    @nullable
    int blackPerfect,
  }) = _Result;

  factory ResultModel.fromJson(Map<String, dynamic> json) => _$ResultModelFromJson(json);
}
