import 'dart:math';

import 'package:flutter_simon/game/Simon.dart';
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

    bool success = simon.isReady();

    expect(success, equals(true));
  });
  test('Simon says color is red', () {
    var simon = Simon(DeterminedRandom());

    List<Color> color = simon.saysColorSuitIs();

    expect(color, equals([Color.RED]));
  });

  test('It is the end of the game if the color given is wrong. After simon says the color suit', () {
    var simon = Simon(DeterminedRandom());

    List<Color> color = simon.saysColorSuitIs();
    bool success = simon.nextColorInSuitIS(Color.GREEN);

    expect(success, equals(false));
  });

  test('Simon should not says the next color in the suit if one of the color repeated is false', () {
    var simon = Simon(DeterminedRandom());

    List<Color> color = simon.saysColorSuitIs();
    bool success = simon.nextColorInSuitIS(Color.RED);
    color = simon.saysColorSuitIs();
    success = simon.nextColorInSuitIS(Color.BLUE);
    color = simon.saysColorSuitIs();

    expect(color, equals([Color.RED, Color.GREEN]));
    expect(success, equals(false));
  });

  test('Simon is waiting for exactly the number of element it give, if you give one more, the game is ended.', () {
    var simon = Simon(DeterminedRandom());

    List<Color> color = simon.saysColorSuitIs();
    bool success = simon.nextColorInSuitIS(Color.RED);
    color = simon.saysColorSuitIs();
    success = simon.nextColorInSuitIS(Color.RED);
    success = simon.nextColorInSuitIS(Color.GREEN);
    success = simon.nextColorInSuitIS(Color.GREEN);

    expect(success, equals(false));
    expect(color, equals([Color.RED, Color.GREEN]));
  });

  test('Simon should return the same color suit if it is waiting for input', () {
    var simon = Simon(DeterminedRandom());

    List<Color> color = simon.saysColorSuitIs();
    color = simon.saysColorSuitIs();
    bool isWaiting = simon.isWaitingForNextColor();

    expect(color, equals([Color.RED]));
    expect(isWaiting, equals(true));
  });

  test(
      'Simon says the next part of the color suit after repeating to it one by one the color in the order of the suit given by him',
      () {
    var simon = Simon(DeterminedRandom());

    List<Color> color = simon.saysColorSuitIs();
    bool success = simon.nextColorInSuitIS(Color.RED);
    color = simon.saysColorSuitIs();
    success = simon.nextColorInSuitIS(Color.RED);
    success = simon.nextColorInSuitIS(Color.GREEN);
    bool isWaiting = simon.isWaitingForNextColor();

    expect(success, equals(true));
    expect(isWaiting, equals(false));
    expect(color, equals([Color.RED, Color.GREEN]));
  });
}
