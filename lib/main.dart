import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_simon/game/simon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simon Says !',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            children: [
              Text(
                "Simon Says !",
                style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.black),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SimonGameScreen()));
                    print("Start game !");
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Hero(tag: "GamePad", child: SimonGameStartButton()),
                      Text(
                        "Press to start",
                        style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

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

class SimonGameStartButton extends StatelessWidget {
  const SimonGameStartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.none,
      alignment: Alignment.center,
      child: Stack(alignment: Alignment.center, children: [
        Container(
          width: 288,
          child: ClipOval(
            child: Column(
              children: [
                Row(
                  children: [
                    SimonButton(
                      color: Colors.red[400],
                      pressedColor: Colors.red[800],
                    ),
                    SimonButton(
                      color: Colors.green[400],
                      pressedColor: Colors.green[800],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SimonButton(color: Colors.blue[400], pressedColor: Colors.blue[800]),
                    SimonButton(
                      color: Colors.yellow[400],
                      pressedColor: Colors.yellow[800],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        ClipOval(
          child: Container(
            width: 128,
            height: 128,
            color: Colors.black,
          ),
        )
      ]),
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

class SimonButton extends StatelessWidget {
  final Color color;
  final Color pressedColor;
  final void Function() onTap;

  const SimonButton({Key key, this.onTap, @required this.color, @required this.pressedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        width: 144,
        height: 144,
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
