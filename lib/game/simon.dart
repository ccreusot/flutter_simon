import 'dart:math';

import 'package:flutter_simon/game/simon_state.dart';

class Simon {
  Random _random;
  SimonState _simonState;

  Simon(Random random)
      : _random = random,
        _simonState =
            SimonState(isWaitingForInput: false, shouldContinue: true, colorSuit: <Color>[], nextColorIndexInSuit: 0);

  SimonState get state => _simonState;

  SimonState saysColorSuitIs() {
    if (_simonState.shouldContinue && !_simonState.isWaitingForInput) {
      _simonState = _simonState.copyWith(
          colorSuit: [..._simonState.colorSuit, Color.values[_random.nextInt(4)]],
          nextColorIndexInSuit: 0,
          isWaitingForInput: true);
    }
    return _simonState;
  }

  SimonState nextColorInSuitIS(Color color) {
    bool shouldContinue = _simonState.nextColorIndexInSuit < _simonState.colorSuit.length &&
        color == _simonState.colorSuit[_simonState.nextColorIndexInSuit];
    bool waitForInput = (_simonState.nextColorIndexInSuit + 1) < _simonState.colorSuit.length;
    _simonState = _simonState.copyWith(
        shouldContinue: shouldContinue,
        isWaitingForInput: waitForInput,
        nextColorIndexInSuit: _simonState.nextColorIndexInSuit + 1);
    return _simonState;
  }
}
