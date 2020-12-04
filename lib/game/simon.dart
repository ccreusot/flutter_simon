import 'dart:math';

enum Color { RED, GREEN, BLUE, YELLOW }

class Simon {
  Random _random;
  List<Color> _colors = [];
  int _nextColor = 0;
  bool _shouldContinue = true;
  bool _isWaitingForInput = false;

  Simon(Random random) : _random = random;

  List<Color> saysColorSuitIs() {
    if (_shouldContinue && !_isWaitingForInput) {
      _colors.add(Color.values[_random.nextInt(4)]);
      _nextColor = 0;
      _isWaitingForInput = true;
    }
    return _colors;
  }

  bool nextColorInSuitIS(Color color) {
    _shouldContinue = _nextColor < _colors.length && color == _colors[_nextColor++];
    _isWaitingForInput = _nextColor < _colors.length;
    return _shouldContinue;
  }

  bool isReady() {
    return _shouldContinue;
  }

  bool isWaitingForNextColor() {
    return _isWaitingForInput;
  }
}
