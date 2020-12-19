import 'package:freezed_annotation/freezed_annotation.dart';

part 'simon_state.freezed.dart';

enum Color { RED, GREEN, BLUE, YELLOW }

@freezed
abstract class SimonState with _$SimonState {
  factory SimonState.start() = Start;
  factory SimonState.waitForInput(int score, List<Color> colorSuit, int nextColorIndexInSuit) = WaitForInput;
  factory SimonState.sayNextColorIs(int score, List<Color> colorSuit) = SayNextColorIs;
  factory SimonState.end(int score) = End;
}
