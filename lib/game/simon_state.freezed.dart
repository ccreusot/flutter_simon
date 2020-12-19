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
  Start start() {
    return Start();
  }

// ignore: unused_element
  WaitForInput waitForInput(
      int score, List<Color> colorSuit, int nextColorIndexInSuit) {
    return WaitForInput(
      score,
      colorSuit,
      nextColorIndexInSuit,
    );
  }

// ignore: unused_element
  SayNextColorIs sayNextColorIs(int score, List<Color> colorSuit) {
    return SayNextColorIs(
      score,
      colorSuit,
    );
  }

// ignore: unused_element
  End end(int score) {
    return End(
      score,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $SimonState = _$SimonStateTearOff();

/// @nodoc
mixin _$SimonState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(),
    @required
        TResult waitForInput(
            int score, List<Color> colorSuit, int nextColorIndexInSuit),
    @required TResult sayNextColorIs(int score, List<Color> colorSuit),
    @required TResult end(int score),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(),
    TResult waitForInput(
        int score, List<Color> colorSuit, int nextColorIndexInSuit),
    TResult sayNextColorIs(int score, List<Color> colorSuit),
    TResult end(int score),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(Start value),
    @required TResult waitForInput(WaitForInput value),
    @required TResult sayNextColorIs(SayNextColorIs value),
    @required TResult end(End value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(Start value),
    TResult waitForInput(WaitForInput value),
    TResult sayNextColorIs(SayNextColorIs value),
    TResult end(End value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $SimonStateCopyWith<$Res> {
  factory $SimonStateCopyWith(
          SimonState value, $Res Function(SimonState) then) =
      _$SimonStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SimonStateCopyWithImpl<$Res> implements $SimonStateCopyWith<$Res> {
  _$SimonStateCopyWithImpl(this._value, this._then);

  final SimonState _value;
  // ignore: unused_field
  final $Res Function(SimonState) _then;
}

/// @nodoc
abstract class $StartCopyWith<$Res> {
  factory $StartCopyWith(Start value, $Res Function(Start) then) =
      _$StartCopyWithImpl<$Res>;
}

/// @nodoc
class _$StartCopyWithImpl<$Res> extends _$SimonStateCopyWithImpl<$Res>
    implements $StartCopyWith<$Res> {
  _$StartCopyWithImpl(Start _value, $Res Function(Start) _then)
      : super(_value, (v) => _then(v as Start));

  @override
  Start get _value => super._value as Start;
}

/// @nodoc
class _$Start implements Start {
  _$Start();

  @override
  String toString() {
    return 'SimonState.start()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Start);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(),
    @required
        TResult waitForInput(
            int score, List<Color> colorSuit, int nextColorIndexInSuit),
    @required TResult sayNextColorIs(int score, List<Color> colorSuit),
    @required TResult end(int score),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return start();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(),
    TResult waitForInput(
        int score, List<Color> colorSuit, int nextColorIndexInSuit),
    TResult sayNextColorIs(int score, List<Color> colorSuit),
    TResult end(int score),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(Start value),
    @required TResult waitForInput(WaitForInput value),
    @required TResult sayNextColorIs(SayNextColorIs value),
    @required TResult end(End value),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return start(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(Start value),
    TResult waitForInput(WaitForInput value),
    TResult sayNextColorIs(SayNextColorIs value),
    TResult end(End value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (start != null) {
      return start(this);
    }
    return orElse();
  }
}

abstract class Start implements SimonState {
  factory Start() = _$Start;
}

/// @nodoc
abstract class $WaitForInputCopyWith<$Res> {
  factory $WaitForInputCopyWith(
          WaitForInput value, $Res Function(WaitForInput) then) =
      _$WaitForInputCopyWithImpl<$Res>;
  $Res call({int score, List<Color> colorSuit, int nextColorIndexInSuit});
}

/// @nodoc
class _$WaitForInputCopyWithImpl<$Res> extends _$SimonStateCopyWithImpl<$Res>
    implements $WaitForInputCopyWith<$Res> {
  _$WaitForInputCopyWithImpl(
      WaitForInput _value, $Res Function(WaitForInput) _then)
      : super(_value, (v) => _then(v as WaitForInput));

  @override
  WaitForInput get _value => super._value as WaitForInput;

  @override
  $Res call({
    Object score = freezed,
    Object colorSuit = freezed,
    Object nextColorIndexInSuit = freezed,
  }) {
    return _then(WaitForInput(
      score == freezed ? _value.score : score as int,
      colorSuit == freezed ? _value.colorSuit : colorSuit as List<Color>,
      nextColorIndexInSuit == freezed
          ? _value.nextColorIndexInSuit
          : nextColorIndexInSuit as int,
    ));
  }
}

/// @nodoc
class _$WaitForInput implements WaitForInput {
  _$WaitForInput(this.score, this.colorSuit, this.nextColorIndexInSuit)
      : assert(score != null),
        assert(colorSuit != null),
        assert(nextColorIndexInSuit != null);

  @override
  final int score;
  @override
  final List<Color> colorSuit;
  @override
  final int nextColorIndexInSuit;

  @override
  String toString() {
    return 'SimonState.waitForInput(score: $score, colorSuit: $colorSuit, nextColorIndexInSuit: $nextColorIndexInSuit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is WaitForInput &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
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
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(colorSuit) ^
      const DeepCollectionEquality().hash(nextColorIndexInSuit);

  @override
  $WaitForInputCopyWith<WaitForInput> get copyWith =>
      _$WaitForInputCopyWithImpl<WaitForInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(),
    @required
        TResult waitForInput(
            int score, List<Color> colorSuit, int nextColorIndexInSuit),
    @required TResult sayNextColorIs(int score, List<Color> colorSuit),
    @required TResult end(int score),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return waitForInput(score, colorSuit, nextColorIndexInSuit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(),
    TResult waitForInput(
        int score, List<Color> colorSuit, int nextColorIndexInSuit),
    TResult sayNextColorIs(int score, List<Color> colorSuit),
    TResult end(int score),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (waitForInput != null) {
      return waitForInput(score, colorSuit, nextColorIndexInSuit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(Start value),
    @required TResult waitForInput(WaitForInput value),
    @required TResult sayNextColorIs(SayNextColorIs value),
    @required TResult end(End value),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return waitForInput(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(Start value),
    TResult waitForInput(WaitForInput value),
    TResult sayNextColorIs(SayNextColorIs value),
    TResult end(End value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (waitForInput != null) {
      return waitForInput(this);
    }
    return orElse();
  }
}

abstract class WaitForInput implements SimonState {
  factory WaitForInput(
          int score, List<Color> colorSuit, int nextColorIndexInSuit) =
      _$WaitForInput;

  int get score;
  List<Color> get colorSuit;
  int get nextColorIndexInSuit;
  $WaitForInputCopyWith<WaitForInput> get copyWith;
}

/// @nodoc
abstract class $SayNextColorIsCopyWith<$Res> {
  factory $SayNextColorIsCopyWith(
          SayNextColorIs value, $Res Function(SayNextColorIs) then) =
      _$SayNextColorIsCopyWithImpl<$Res>;
  $Res call({int score, List<Color> colorSuit});
}

/// @nodoc
class _$SayNextColorIsCopyWithImpl<$Res> extends _$SimonStateCopyWithImpl<$Res>
    implements $SayNextColorIsCopyWith<$Res> {
  _$SayNextColorIsCopyWithImpl(
      SayNextColorIs _value, $Res Function(SayNextColorIs) _then)
      : super(_value, (v) => _then(v as SayNextColorIs));

  @override
  SayNextColorIs get _value => super._value as SayNextColorIs;

  @override
  $Res call({
    Object score = freezed,
    Object colorSuit = freezed,
  }) {
    return _then(SayNextColorIs(
      score == freezed ? _value.score : score as int,
      colorSuit == freezed ? _value.colorSuit : colorSuit as List<Color>,
    ));
  }
}

/// @nodoc
class _$SayNextColorIs implements SayNextColorIs {
  _$SayNextColorIs(this.score, this.colorSuit)
      : assert(score != null),
        assert(colorSuit != null);

  @override
  final int score;
  @override
  final List<Color> colorSuit;

  @override
  String toString() {
    return 'SimonState.sayNextColorIs(score: $score, colorSuit: $colorSuit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SayNextColorIs &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)) &&
            (identical(other.colorSuit, colorSuit) ||
                const DeepCollectionEquality()
                    .equals(other.colorSuit, colorSuit)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(score) ^
      const DeepCollectionEquality().hash(colorSuit);

  @override
  $SayNextColorIsCopyWith<SayNextColorIs> get copyWith =>
      _$SayNextColorIsCopyWithImpl<SayNextColorIs>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(),
    @required
        TResult waitForInput(
            int score, List<Color> colorSuit, int nextColorIndexInSuit),
    @required TResult sayNextColorIs(int score, List<Color> colorSuit),
    @required TResult end(int score),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return sayNextColorIs(score, colorSuit);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(),
    TResult waitForInput(
        int score, List<Color> colorSuit, int nextColorIndexInSuit),
    TResult sayNextColorIs(int score, List<Color> colorSuit),
    TResult end(int score),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sayNextColorIs != null) {
      return sayNextColorIs(score, colorSuit);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(Start value),
    @required TResult waitForInput(WaitForInput value),
    @required TResult sayNextColorIs(SayNextColorIs value),
    @required TResult end(End value),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return sayNextColorIs(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(Start value),
    TResult waitForInput(WaitForInput value),
    TResult sayNextColorIs(SayNextColorIs value),
    TResult end(End value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (sayNextColorIs != null) {
      return sayNextColorIs(this);
    }
    return orElse();
  }
}

abstract class SayNextColorIs implements SimonState {
  factory SayNextColorIs(int score, List<Color> colorSuit) = _$SayNextColorIs;

  int get score;
  List<Color> get colorSuit;
  $SayNextColorIsCopyWith<SayNextColorIs> get copyWith;
}

/// @nodoc
abstract class $EndCopyWith<$Res> {
  factory $EndCopyWith(End value, $Res Function(End) then) =
      _$EndCopyWithImpl<$Res>;
  $Res call({int score});
}

/// @nodoc
class _$EndCopyWithImpl<$Res> extends _$SimonStateCopyWithImpl<$Res>
    implements $EndCopyWith<$Res> {
  _$EndCopyWithImpl(End _value, $Res Function(End) _then)
      : super(_value, (v) => _then(v as End));

  @override
  End get _value => super._value as End;

  @override
  $Res call({
    Object score = freezed,
  }) {
    return _then(End(
      score == freezed ? _value.score : score as int,
    ));
  }
}

/// @nodoc
class _$End implements End {
  _$End(this.score) : assert(score != null);

  @override
  final int score;

  @override
  String toString() {
    return 'SimonState.end(score: $score)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is End &&
            (identical(other.score, score) ||
                const DeepCollectionEquality().equals(other.score, score)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(score);

  @override
  $EndCopyWith<End> get copyWith => _$EndCopyWithImpl<End>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult start(),
    @required
        TResult waitForInput(
            int score, List<Color> colorSuit, int nextColorIndexInSuit),
    @required TResult sayNextColorIs(int score, List<Color> colorSuit),
    @required TResult end(int score),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return end(score);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult start(),
    TResult waitForInput(
        int score, List<Color> colorSuit, int nextColorIndexInSuit),
    TResult sayNextColorIs(int score, List<Color> colorSuit),
    TResult end(int score),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (end != null) {
      return end(score);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult start(Start value),
    @required TResult waitForInput(WaitForInput value),
    @required TResult sayNextColorIs(SayNextColorIs value),
    @required TResult end(End value),
  }) {
    assert(start != null);
    assert(waitForInput != null);
    assert(sayNextColorIs != null);
    assert(end != null);
    return end(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult start(Start value),
    TResult waitForInput(WaitForInput value),
    TResult sayNextColorIs(SayNextColorIs value),
    TResult end(End value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (end != null) {
      return end(this);
    }
    return orElse();
  }
}

abstract class End implements SimonState {
  factory End(int score) = _$End;

  int get score;
  $EndCopyWith<End> get copyWith;
}
