import 'dart:math';

import 'package:flutter_simon/game/simon.dart';
import 'package:flutter_simon/game/simon_state.dart';
import 'package:flutter_test/flutter_test.dart';

class DeterminedRandom implements Random {
  int value = 0;

  @override
  bool nextBool() {
    return false;
  }

  @override
  double nextDouble() {
    return 0.0;
  }

  @override
  int nextInt(int max) {
    return value++;
  }
}

void main() {
  test('When we start Simon it should be ready to play', () {
    var simon = Simon(DeterminedRandom());

    expect(simon.state.shouldContinue, equals(true));
  });
  test('Simon says color is red', () {
    var simon = Simon(DeterminedRandom());

    SimonState state = simon.saysColorSuitIs();

    expect(state.colorSuit, equals([Color.RED]));
  });

  test('It is the end of the game if the color given is wrong. After simon says the color suit', () {
    var simon = Simon(DeterminedRandom());

    simon.saysColorSuitIs();
    SimonState state = simon.nextColorInSuitIS(Color.GREEN);

    expect(state.shouldContinue, equals(false));
  });

  test('Simon should not says the next color in the suit if one of the color repeated is false', () {
    var simon = Simon(DeterminedRandom());

    simon.saysColorSuitIs();
    simon.nextColorInSuitIS(Color.RED);
    simon.saysColorSuitIs();
    simon.nextColorInSuitIS(Color.BLUE);
    SimonState state = simon.saysColorSuitIs();

    expect(state.colorSuit, equals([Color.RED, Color.GREEN]));
    expect(state.shouldContinue, equals(false));
  });

  test('Simon is waiting for exactly the number of element it give, if you give one more, the game is ended.', () {
    var simon = Simon(DeterminedRandom());

    simon.saysColorSuitIs();
    simon.nextColorInSuitIS(Color.RED);
    simon.saysColorSuitIs();
    simon.nextColorInSuitIS(Color.RED);
    simon.nextColorInSuitIS(Color.GREEN);
    SimonState state = simon.nextColorInSuitIS(Color.GREEN);

    expect(state.shouldContinue, equals(false));
    expect(state.colorSuit, equals([Color.RED, Color.GREEN]));
  });

  test('Simon should return the same color suit if it is waiting for input', () {
    var simon = Simon(DeterminedRandom());

    simon.saysColorSuitIs();
    SimonState state = simon.saysColorSuitIs();

    expect(state.colorSuit, equals([Color.RED]));
    expect(state.isWaitingForInput, equals(true));
  });

  test(
      'Simon says the next part of the color suit after repeating to it one by one the color in the order of the suit given by him',
      () {
    var simon = Simon(DeterminedRandom());

    simon.saysColorSuitIs();
    simon.nextColorInSuitIS(Color.RED);
    simon.saysColorSuitIs();
    simon.nextColorInSuitIS(Color.RED);
    SimonState state = simon.nextColorInSuitIS(Color.GREEN);

    expect(state.shouldContinue, equals(true));
    expect(state.isWaitingForInput, equals(false));
    expect(state.colorSuit, equals([Color.RED, Color.GREEN]));
  });
}
