import 'dart:math';
import 'dart:async';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_simon/game/simon.dart';
import 'package:flutter_simon/game/simon_state.dart' as state;

class SimonGameScreen extends StatefulWidget {
  @override
  _SimonGameScreenState createState() => _SimonGameScreenState();
}

class _SimonGameScreenState extends State<SimonGameScreen> {
  Simon _simon;
  Timer _gameLoopTimer;
  String _message;
  int _startingCountDown;
  Stopwatch _elapsedTimeObserver;
  bool _isPlayingColorSuit;

  @override
  void initState() {
    super.initState();
    _simon = Simon(Random());
    _startingCountDown = 3;
    _elapsedTimeObserver = Stopwatch();
    _isPlayingColorSuit = false;
    _message = "Ready";
    _elapsedTimeObserver.start();
    _gameLoopTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      // if (_simon.state.shouldContinue) {
      //   if (_simon.state.colorSuit.isEmpty && _startingCountDown >= 0) {
      //     if (_elapsedTimeObserver.elapsed.inSeconds >= 1) {
      //       setState(() {
      //         if (_startingCountDown == 0) {
      //           _message = "";
      //         } else {
      //           _message = "$_startingCountDown";
      //         }
      //         _startingCountDown--;
      //       });
      //       _elapsedTimeObserver.reset();
      //     }
      //   } else {
      //     if (!_simon.state.isWaitingForInput) {
      //       print("next Suit !");
      //       setState(() {
      //         _simon.saysColorSuitIs();
      //         _isPlayingColorSuit = true;
      //       });
      //     } else {}
      //   }
      // }
    });
  }

  @override
  void dispose() {
    _gameLoopTimer.cancel();
    _elapsedTimeObserver.stop();
    super.dispose();
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
                  onTap: (selectedColor) {
                    setState(() {
                      _simon.nextColorInSuitIS(selectedColor);
                    });
                  },
                )
              : SimonColorSuitPlayer(
                  colorSuit: [],
                  onEnded: () {
                    setState(() {
                      _isPlayingColorSuit = false;
                      _startingCountDown = 6;
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
  final void Function(state.Color selectedColor) onTap;

  const SimonGamePad({Key key, this.message, this.onTap}) : super(key: key);

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
