// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Result _$_$_ResultFromJson(Map<String, dynamic> json) {
  return _$_Result(
    id: json['id'] as String,
    tp: (json['TP'] as num)?.toDouble(),
    perfect: json['PERFECT'] as int,
    good: json['GOOD'] as int,
    bad: json['BAD'] as int,
    miss: json['MISS'] as int,
    blackPerfect: json['blackPerfect'] as int,
  );
}

Map<String, dynamic> _$_$_ResultToJson(_$_Result instance) => <String, dynamic>{
      'id': instance.id,
      'TP': instance.tp,
      'PERFECT': instance.perfect,
      'GOOD': instance.good,
      'BAD': instance.bad,
      'MISS': instance.miss,
      'blackPerfect': instance.blackPerfect,
    };
