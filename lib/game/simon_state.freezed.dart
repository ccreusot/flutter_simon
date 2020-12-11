// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'simon_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SimonStateTearOff {
  const _$SimonStateTearOff();

// ignore: unused_element
  _SimonState call(
      {bool isWaitingForInput,
      bool shouldContinue,
      List<Color> colorSuit,
      int nextColorIndexInSuit}) {
    return _SimonState(
      isWaitingForInput: isWaitingForInput,
      shouldContinue: shouldContinue,
      colorSuit: colorSuit,
      nextColorIndexInSuit: nextColorIndexInSuit,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SimonState = _$SimonStateTearOff();

/// @nodoc
mixin _$SimonState {
  bool get isWaitingForInput;
  bool get shouldContinue;
  List<Color> get colorSuit;
  int get nextColorIndexInSuit;

  $SimonStateCopyWith<SimonState> get copyWith;
}

/// @nodoc
abstract class $SimonStateCopyWith<$Res> {
  factory $SimonStateCopyWith(
          SimonState value, $Res Function(SimonState) then) =
      _$SimonStateCopyWithImpl<$Res>;
  $Res call(
      {bool isWaitingForInput,
      bool shouldContinue,
      List<Color> colorSuit,
      int nextColorIndexInSuit});
}

/// @nodoc
class _$SimonStateCopyWithImpl<$Res> implements $SimonStateCopyWith<$Res> {
  _$SimonStateCopyWithImpl(this._value, this._then);

  final SimonState _value;
  // ignore: unused_field
  final $Res Function(SimonState) _then;

  @override
  $Res call({
    Object isWaitingForInput = freezed,
    Object shouldContinue = freezed,
    Object colorSuit = freezed,
    Object nextColorIndexInSuit = freezed,
  }) {
    return _then(_value.copyWith(
      isWaitingForInput: isWaitingForInput == freezed
          ? _value.isWaitingForInput
          : isWaitingForInput as bool,
      shouldContinue: shouldContinue == freezed
          ? _value.shouldContinue
          : shouldContinue as bool,
      colorSuit:
          colorSuit == freezed ? _value.colorSuit : colorSuit as List<Color>,
      nextColorIndexInSuit: nextColorIndexInSuit == freezed
          ? _value.nextColorIndexInSuit
          : nextColorIndexInSuit as int,
    ));
  }
}

/// @nodoc
abstract class _$SimonStateCopyWith<$Res> implements $SimonStateCopyWith<$Res> {
  factory _$SimonStateCopyWith(
          _SimonState value, $Res Function(_SimonState) then) =
      __$SimonStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isWaitingForInput,
      bool shouldContinue,
      List<Color> colorSuit,
      int nextColorIndexInSuit});
}

/// @nodoc
class __$SimonStateCopyWithImpl<$Res> extends _$SimonStateCopyWithImpl<$Res>
    implements _$SimonStateCopyWith<$Res> {
  __$SimonStateCopyWithImpl(
      _SimonState _value, $Res Function(_SimonState) _then)
      : super(_value, (v) => _then(v as _SimonState));

  @override
  _SimonState get _value => super._value as _SimonState;

  @override
  $Res call({
    Object isWaitingForInput = freezed,
    Object shouldContinue = freezed,
    Object colorSuit = freezed,
    Object nextColorIndexInSuit = freezed,
  }) {
    return _then(_SimonState(
      isWaitingForInput: isWaitingForInput == freezed
          ? _value.isWaitingForInput
          : isWaitingForInput as bool,
      shouldContinue: shouldContinue == freezed
          ? _value.shouldContinue
          : shouldContinue as bool,
      colorSuit:
          colorSuit == freezed ? _value.colorSuit : colorSuit as List<Color>,
      nextColorIndexInSuit: nextColorIndexInSuit == freezed
          ? _value.nextColorIndexInSuit
          : nextColorIndexInSuit as int,
    ));
  }
}

/// @nodoc
class _$_SimonState implements _SimonState {
  _$_SimonState(
      {this.isWaitingForInput,
      this.shouldContinue,
      this.colorSuit,
      this.nextColorIndexInSuit});

  @override
  final bool isWaitingForInput;
  @override
  final bool shouldContinue;
  @override
  final List<Color> colorSuit;
  @override
  final int nextColorIndexInSuit;

  @override
  String toString() {
    return 'SimonState(isWaitingForInput: $isWaitingForInput, shouldContinue: $shouldContinue, colorSuit: $colorSuit, nextColorIndexInSuit: $nextColorIndexInSuit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SimonState &&
            (identical(other.isWaitingForInput, isWaitingForInput) ||
                const DeepCollectionEquality()
                    .equals(other.isWaitingForInput, isWaitingForInput)) &&
            (identical(other.shouldContinue, shouldContinue) ||
                const DeepCollectionEquality()
                    .equals(other.shouldContinue, shouldContinue)) &&
            (identical(other.colorSuit, colorSuit) ||
                const DeepCollectionEquality()
                    .equals(other.colorSuit, colorSuit)) &&
            (identical(other.nextColorIndexInSuit, nextColorIndexInSuit) ||
                const DeepCollectionEquality()
                    .equals(other.nextColorIndexInSuit, nextColorIndexInSuit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isWaitingForInput) ^
      const DeepCollectionEquality().hash(shouldContinue) ^
      const DeepCollectionEquality().hash(colorSuit) ^
      const DeepCollectionEquality().hash(nextColorIndexInSuit);

  @override
  _$SimonStateCopyWith<_SimonState> get copyWith =>
      __$SimonStateCopyWithImpl<_SimonState>(this, _$identity);
}

abstract class _SimonState implements SimonState {
  factory _SimonState(
      {bool isWaitingForInput,
      bool shouldContinue,
      List<Color> colorSuit,
      int nextColorIndexInSuit}) = _$_SimonState;

  @override
  bool get isWaitingForInput;
  @override
  bool get shouldContinue;
  @override
  List<Color> get colorSuit;
  @override
  int get nextColorIndexInSuit;
  @override
  _$SimonStateCopyWith<_SimonState> get copyWith;
}
