import 'dart:math';

import 'package:flutter_simon/game/simon_state.dart';

class Simon {
  Random _random;
  SimonState _simonState;

  Simon(Random random)
      : _random = random,
        _simonState = SimonState.start();

  SimonState get state => _simonState;

  SimonState saysColorSuitIs() {
    _simonState = _simonState.when(
        start: () {
          return SimonState.waitForInput(0, [Color.values[_random.nextInt(4)]], 0);
        },
        waitForInput: (int score, List<Color> colorSuit, int nextColorIndexInSuit) {
          return SimonState.waitForInput(score, colorSuit, 0);
        },
        sayNextColorIs: (int score, List<Color> colorSuit) {
          return SimonState.waitForInput(score + 1, [...colorSuit, Color.values[_random.nextInt(4)]], 0);
        },
        end: (int score) => SimonState.end(score));
    return _simonState;
  }

  SimonState nextColorInSuitIS(Color color) {
    _simonState = _simonState.when(
        start: () => _simonState,
        waitForInput: (int score, List<Color> colorSuit, int nextColorIndexInSuit) {
          if (nextColorIndexInSuit < colorSuit.length && color == colorSuit[nextColorIndexInSuit]) {
            if (nextColorIndexInSuit + 1 < colorSuit.length) {
              return SimonState.waitForInput(score, colorSuit, nextColorIndexInSuit + 1);
            } else {
              return SimonState.sayNextColorIs(score, colorSuit);
            }
          } else {
            return SimonState.end(score);
          }
        },
        sayNextColorIs: (int score, List<Color> colorSuit) => SimonState.end(score),
        end: (int score) => SimonState.end(score));
    // bool shouldContinue = _simonState.nextColorIndexInSuit < _simonState.colorSuit.length &&
    //     color == _simonState.colorSuit[_simonState.nextColorIndexInSuit];
    // bool waitForInput = (_simonState.nextColorIndexInSuit + 1) < _simonState.colorSuit.length;
    // _simonState = _simonState.copyWith(
    //     shouldContinue: shouldContinue,
    //     isWaitingForInput: waitForInput,
    //     nextColorIndexInSuit: _simonState.nextColorIndexInSuit + 1);
    return _simonState;
  }

  SimonState endGame() {
    _simonState = _simonState.when(
        start: () => SimonState.end(0),
        waitForInput: (int score, List<Color> colorSuit, int nextIndex) => SimonState.end(score),
        sayNextColorIs: (int score, List<Color> colorSuit) => SimonState.end(score),
        end: (int score) => _simonState);
    return _simonState;
  }
}
