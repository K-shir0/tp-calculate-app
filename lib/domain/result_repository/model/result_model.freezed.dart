// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ResultModelTearOff {
  const _$ResultModelTearOff();

// ignore: unused_element
  _Result call(
      {@nullable String id,
      double tp = 0,
      int perfect = 0,
      int good = 0,
      int bad = 0,
      int miss = 0,
      int blackPerfect = 0}) {
    return _Result(
      id: id,
      tp: tp,
      perfect: perfect,
      good: good,
      bad: bad,
      miss: miss,
      blackPerfect: blackPerfect,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ResultModel = _$ResultModelTearOff();

/// @nodoc
mixin _$ResultModel {
  @nullable
  String get id;
  double get tp;
  int get perfect;
  int get good;
  int get bad;
  int get miss;
  int get blackPerfect;

  $ResultModelCopyWith<ResultModel> get copyWith;
}

/// @nodoc
abstract class $ResultModelCopyWith<$Res> {
  factory $ResultModelCopyWith(
          ResultModel value, $Res Function(ResultModel) then) =
      _$ResultModelCopyWithImpl<$Res>;
  $Res call(
      {@nullable String id,
      double tp,
      int perfect,
      int good,
      int bad,
      int miss,
      int blackPerfect});
}

/// @nodoc
class _$ResultModelCopyWithImpl<$Res> implements $ResultModelCopyWith<$Res> {
  _$ResultModelCopyWithImpl(this._value, this._then);

  final ResultModel _value;
  // ignore: unused_field
  final $Res Function(ResultModel) _then;

  @override
  $Res call({
    Object id = freezed,
    Object tp = freezed,
    Object perfect = freezed,
    Object good = freezed,
    Object bad = freezed,
    Object miss = freezed,
    Object blackPerfect = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      tp: tp == freezed ? _value.tp : tp as double,
      perfect: perfect == freezed ? _value.perfect : perfect as int,
      good: good == freezed ? _value.good : good as int,
      bad: bad == freezed ? _value.bad : bad as int,
      miss: miss == freezed ? _value.miss : miss as int,
      blackPerfect:
          blackPerfect == freezed ? _value.blackPerfect : blackPerfect as int,
    ));
  }
}

/// @nodoc
abstract class _$ResultCopyWith<$Res> implements $ResultModelCopyWith<$Res> {
  factory _$ResultCopyWith(_Result value, $Res Function(_Result) then) =
      __$ResultCopyWithImpl<$Res>;
  @override
  $Res call(
      {@nullable String id,
      double tp,
      int perfect,
      int good,
      int bad,
      int miss,
      int blackPerfect});
}

/// @nodoc
class __$ResultCopyWithImpl<$Res> extends _$ResultModelCopyWithImpl<$Res>
    implements _$ResultCopyWith<$Res> {
  __$ResultCopyWithImpl(_Result _value, $Res Function(_Result) _then)
      : super(_value, (v) => _then(v as _Result));

  @override
  _Result get _value => super._value as _Result;

  @override
  $Res call({
    Object id = freezed,
    Object tp = freezed,
    Object perfect = freezed,
    Object good = freezed,
    Object bad = freezed,
    Object miss = freezed,
    Object blackPerfect = freezed,
  }) {
    return _then(_Result(
      id: id == freezed ? _value.id : id as String,
      tp: tp == freezed ? _value.tp : tp as double,
      perfect: perfect == freezed ? _value.perfect : perfect as int,
      good: good == freezed ? _value.good : good as int,
      bad: bad == freezed ? _value.bad : bad as int,
      miss: miss == freezed ? _value.miss : miss as int,
      blackPerfect:
          blackPerfect == freezed ? _value.blackPerfect : blackPerfect as int,
    ));
  }
}

/// @nodoc
class _$_Result implements _Result {
  const _$_Result(
      {@nullable this.id,
      this.tp = 0,
      this.perfect = 0,
      this.good = 0,
      this.bad = 0,
      this.miss = 0,
      this.blackPerfect = 0})
      : assert(tp != null),
        assert(perfect != null),
        assert(good != null),
        assert(bad != null),
        assert(miss != null),
        assert(blackPerfect != null);

  @override
  @nullable
  final String id;
  @JsonKey(defaultValue: 0)
  @override
  final double tp;
  @JsonKey(defaultValue: 0)
  @override
  final int perfect;
  @JsonKey(defaultValue: 0)
  @override
  final int good;
  @JsonKey(defaultValue: 0)
  @override
  final int bad;
  @JsonKey(defaultValue: 0)
  @override
  final int miss;
  @JsonKey(defaultValue: 0)
  @override
  final int blackPerfect;

  @override
  String toString() {
    return 'ResultModel(id: $id, tp: $tp, perfect: $perfect, good: $good, bad: $bad, miss: $miss, blackPerfect: $blackPerfect)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Result &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.tp, tp) ||
                const DeepCollectionEquality().equals(other.tp, tp)) &&
            (identical(other.perfect, perfect) ||
                const DeepCollectionEquality()
                    .equals(other.perfect, perfect)) &&
            (identical(other.good, good) ||
                const DeepCollectionEquality().equals(other.good, good)) &&
            (identical(other.bad, bad) ||
                const DeepCollectionEquality().equals(other.bad, bad)) &&
            (identical(other.miss, miss) ||
                const DeepCollectionEquality().equals(other.miss, miss)) &&
            (identical(other.blackPerfect, blackPerfect) ||
                const DeepCollectionEquality()
                    .equals(other.blackPerfect, blackPerfect)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(tp) ^
      const DeepCollectionEquality().hash(perfect) ^
      const DeepCollectionEquality().hash(good) ^
      const DeepCollectionEquality().hash(bad) ^
      const DeepCollectionEquality().hash(miss) ^
      const DeepCollectionEquality().hash(blackPerfect);

  @override
  _$ResultCopyWith<_Result> get copyWith =>
      __$ResultCopyWithImpl<_Result>(this, _$identity);
}

abstract class _Result implements ResultModel {
  const factory _Result(
      {@nullable String id,
      double tp,
      int perfect,
      int good,
      int bad,
      int miss,
      int blackPerfect}) = _$_Result;

  @override
  @nullable
  String get id;
  @override
  double get tp;
  @override
  int get perfect;
  @override
  int get good;
  @override
  int get bad;
  @override
  int get miss;
  @override
  int get blackPerfect;
  @override
  _$ResultCopyWith<_Result> get copyWith;
}
