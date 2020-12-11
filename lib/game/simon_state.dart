import 'package:freezed_annotation/freezed_annotation.dart';

part 'simon_state.freezed.dart';

enum Color { RED, GREEN, BLUE, YELLOW }

@freezed
abstract class SimonState with _$SimonState {
  factory SimonState({bool isWaitingForInput, bool shouldContinue, List<Color> colorSuit, int nextColorIndexInSuit}) =
      _SimonState;
}
