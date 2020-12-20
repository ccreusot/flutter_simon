import 'dart:math';
import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_simon/game/simon.dart';
import 'package:flutter_simon/game/simon_state.dart' as state;
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SimonGameScreen extends StatefulWidget {
  @override
  _SimonGameScreenState createState() => _SimonGameScreenState();
}

class _SimonGameScreenState extends State<SimonGameScreen> {
  Simon _simon;
  Timer _gameLoopTimer;
  String _message;
  bool _isPlayingColorSuit;
  Timer _endGame;
  Timer _tapTimer;
  double _timer = 100;

  @override
  void initState() {
    super.initState();
    _simon = Simon(Random());
    _isPlayingColorSuit = false;
    _message = "Ready";

    startGame();
    _gameLoopTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      _simon.state.when(
          start: () {/* do nothing */},
          waitForInput: (int score, List<state.Color> colorSuit, int nextIndex) {},
          sayNextColorIs: (int score, List<state.Color> colorSuit) {
            Timer(Duration(milliseconds: 500), () {
              setState(() {
                _simon.saysColorSuitIs();
                _isPlayingColorSuit = true;
              });
            });
          },
          end: (int score) {
            setState(() {
              _message = "Game Over\nScore: $score";
            });
            endGame();
          });
    });
  }

  @override
  void dispose() {
    _gameLoopTimer.cancel();
    if (_endGame != null) {
      _endGame.cancel();
    }
    if (_tapTimer != null) {
      _tapTimer.cancel();
    }
    super.dispose();
  }

  void startGame() {
    Timer(Duration(seconds: 2), () {
      if (_simon.state is state.Start) {
        setState(() {
          _message = "Simon Says";
        });
        startSimon();
      }
    });
  }

  void startSimon() {
    Timer(Duration(seconds: 1), () {
      if (_simon.state is state.Start) {
        setState(() {
          _message = "";
          _simon.saysColorSuitIs();
          _isPlayingColorSuit = true;
        });
      }
    });
  }

  void endGame() {
    if (_endGame != null) return;
    if (_tapTimer != null) {
      _tapTimer.cancel();
    }
    _endGame = Timer(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  void startTapTimer() {
    if (_tapTimer != null) _tapTimer.cancel();
    setState(() {
      _timer = 1;
      _tapTimer = Timer.periodic(Duration(milliseconds: 5), (timer) {
        if (_timer <= 0.001) {
          print("END GAME");
          _tapTimer.cancel();
          _simon.endGame();
          return;
        }
        setState(() {
          _timer -= 0.001;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Hero(
          tag: "GamePad",
          child: (!_isPlayingColorSuit)
              ? SimonGamePad(
                  message: _message,
                  time: _timer,
                  onTap: (selectedColor) {
                    setState(() {
                      _simon.nextColorInSuitIS(selectedColor);
                      _simon.state.when(start: () {
                        return;
                      }, waitForInput: (int score, List<state.Color> colorSuit, int nextIndex) {
                        startTapTimer();
                        return;
                      }, sayNextColorIs: (int score, List<state.Color> colorSuit) {
                        _message = "Simon Says";
                        _tapTimer.cancel();
                        return;
                      }, end: (int score) {
                        _tapTimer.cancel();
                        return;
                      });
                    });
                  },
                )
              : SimonColorSuitPlayer(
                  colorSuit: _simon.state.when(
                      start: () => [],
                      waitForInput: (int score, List<state.Color> colorSuit, int nextIndex) => colorSuit,
                      sayNextColorIs: (int score, List<state.Color> colorSuit) => colorSuit,
                      end: (int score) => []),
                  onEnded: () {
                    setState(() {
                      _message = "";
                      _isPlayingColorSuit = false;
                      startTapTimer();
                    });
                  },
                ),
        ),
      ),
    );
  }
}

class SimonGamePad extends StatelessWidget {
  final String message;
  final double time;
  final void Function(state.Color selectedColor) onTap;

  const SimonGamePad({Key key, this.message, this.time, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NoBoundSimonButton(
                      color: Colors.red[400],
                      pressedColor: Colors.red[800],
                      onTap: () => onTap(state.Color.RED),
                    ),
                  ),
                  Expanded(
                    child: NoBoundSimonButton(
                      color: Colors.green[400],
                      pressedColor: Colors.green[800],
                      onTap: () => onTap(state.Color.GREEN),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NoBoundSimonButton(
                      color: Colors.blue[400],
                      pressedColor: Colors.blue[800],
                      onTap: () => onTap(state.Color.BLUE),
                    ),
                  ),
                  Expanded(
                    child: NoBoundSimonButton(
                      color: Colors.yellow[400],
                      pressedColor: Colors.yellow[800],
                      onTap: () => onTap(state.Color.YELLOW),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        ClipOval(child: Container(width: 192, height: 192, color: Colors.black)),
        Text(
          message,
          style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white),
        ),
        if (message.isEmpty)
          SleekCircularSlider(
            min: 0,
            max: 1,
            initialValue: this.time,
            innerWidget: (value) {
              return Container();
            },
            appearance: CircularSliderAppearance(
              animationEnabled: false,
              infoProperties: InfoProperties(),
              customWidths: CustomSliderWidths(
                progressBarWidth: 4.0,
                trackWidth: 4.0,
              ),
              customColors: CustomSliderColors(
                dynamicGradient: false,
                progressBarColor: Colors.white,
                trackColor: Colors.transparent,
              ),
            ),
          )
      ],
    );
  }
}

class SimonColorSuitPlayer extends StatefulWidget {
  final List<state.Color> _colorSuit;
  final void Function() onEnded;

  const SimonColorSuitPlayer({Key key, List<state.Color> colorSuit, this.onEnded})
      : _colorSuit = colorSuit,
        super(key: key);

  @override
  _SimonColorSuitPlayerState createState() => _SimonColorSuitPlayerState();
}

class _SimonColorSuitPlayerState extends State<SimonColorSuitPlayer> {
  double _nextColorIndex = 0;
  Timer _playerTimer;

  @override
  void initState() {
    super.initState();
    print("Start Playing suit ${widget._colorSuit}");
    _nextColorIndex = 0;
    if (widget._colorSuit.isEmpty) {
      widget.onEnded();
      return;
    }
    _playerTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      if (_nextColorIndex < widget._colorSuit.length - 1) {
        setState(() {
          _nextColorIndex += 0.5;
        });
      } else {
        print("onEnd player");
        widget.onEnded();
      }
    });
  }

  @override
  void dispose() {
    _playerTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    state.Color highlightColor =
        (_nextColorIndex - _nextColorIndex.floor() == 0.5) ? null : widget._colorSuit[_nextColorIndex.floor()];
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NoBoundSimonButton(
                      color: (highlightColor == state.Color.RED) ? Colors.red[800] : Colors.red[400],
                      pressedColor: Colors.red[800],
                    ),
                  ),
                  Expanded(
                    child: NoBoundSimonButton(
                      color: (highlightColor == state.Color.GREEN) ? Colors.green[800] : Colors.green[400],
                      pressedColor: Colors.green[800],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: NoBoundSimonButton(
                      color: (highlightColor == state.Color.BLUE) ? Colors.blue[800] : Colors.blue[400],
                      pressedColor: Colors.blue[800],
                    ),
                  ),
                  Expanded(
                    child: NoBoundSimonButton(
                        color: (highlightColor == state.Color.YELLOW) ? Colors.yellow[800] : Colors.yellow[400],
                        pressedColor: Colors.yellow[800]),
                  ),
                ],
              ),
            )
          ],
        ),
        ClipOval(child: Container(width: 192, height: 192, color: Colors.black)),
      ],
    );
  }
}

class NoBoundSimonButton extends StatelessWidget {
  final Color color;
  final Color pressedColor;
  final void Function() onTap;

  const NoBoundSimonButton({Key key, this.onTap, @required this.color, @required this.pressedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.linear,
        child: Material(
            color: this.color,
            child: InkWell(
              splashColor: this.pressedColor,
              highlightColor: this.pressedColor,
              onTap: this.onTap,
            )));
  }
}
