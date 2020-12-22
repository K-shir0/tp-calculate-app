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
      @nullable Float tp,
      @nullable int perfect,
      @nullable int good,
      @nullable int bad,
      @nullable int miss,
      @nullable int blackPerfect}) {
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
  @nullable
  Float get tp;
  @nullable
  int get perfect;
  @nullable
  int get good;
  @nullable
  int get bad;
  @nullable
  int get miss;
  @nullable
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
      @nullable Float tp,
      @nullable int perfect,
      @nullable int good,
      @nullable int bad,
      @nullable int miss,
      @nullable int blackPerfect});
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
      tp: tp == freezed ? _value.tp : tp as Float,
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
      @nullable Float tp,
      @nullable int perfect,
      @nullable int good,
      @nullable int bad,
      @nullable int miss,
      @nullable int blackPerfect});
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
      tp: tp == freezed ? _value.tp : tp as Float,
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
      @nullable this.tp,
      @nullable this.perfect,
      @nullable this.good,
      @nullable this.bad,
      @nullable this.miss,
      @nullable this.blackPerfect});

  @override
  @nullable
  final String id;
  @override
  @nullable
  final Float tp;
  @override
  @nullable
  final int perfect;
  @override
  @nullable
  final int good;
  @override
  @nullable
  final int bad;
  @override
  @nullable
  final int miss;
  @override
  @nullable
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
      @nullable Float tp,
      @nullable int perfect,
      @nullable int good,
      @nullable int bad,
      @nullable int miss,
      @nullable int blackPerfect}) = _$_Result;

  @override
  @nullable
  String get id;
  @override
  @nullable
  Float get tp;
  @override
  @nullable
  int get perfect;
  @override
  @nullable
  int get good;
  @override
  @nullable
  int get bad;
  @override
  @nullable
  int get miss;
  @override
  @nullable
  int get blackPerfect;
  @override
  _$ResultCopyWith<_Result> get copyWith;
}
