import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_simon/game/simon.dart';

class SimonGameScreen extends StatefulWidget {
  @override
  _SimonGameScreenState createState() => _SimonGameScreenState();
}

class _SimonGameScreenState extends State<SimonGameScreen> {
  Simon _simon;

  @override
  void initState() {
    super.initState();
    _simon = Simon(Random());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Hero(
          tag: "GamePad",
          child: Stack(
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
                          ),
                        ),
                        Expanded(
                          child: NoBoundSimonButton(
                            color: Colors.green[400],
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
                            color: Colors.blue[400],
                            pressedColor: Colors.blue[800],
                          ),
                        ),
                        Expanded(
                          child: NoBoundSimonButton(color: Colors.yellow[400], pressedColor: Colors.yellow[800]),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              ClipOval(child: Container(width: 192, height: 192, color: Colors.black))
            ],
          ),
        ),
      ),
    );
  }
}

class SimonColorSuitPlayer extends StatefulWidget {
  final List<Color> _colorSuit;

  const SimonColorSuitPlayer({Key key, List<Color> colorSuit})
      : _colorSuit = colorSuit,
        super(key: key);

  @override
  _SimonColorSuitPlayerState createState() => _SimonColorSuitPlayerState();
}

class _SimonColorSuitPlayerState extends State<SimonColorSuitPlayer> {
  int _nextColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container();
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
              focusColor: this.pressedColor,
              highlightColor: this.pressedColor,
              hoverColor: this.pressedColor,
              onTap: this.onTap,
            )));
  }
}
