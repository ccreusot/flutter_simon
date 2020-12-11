import 'dart:math';

import 'package:flutter/material.dart';
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
      home: SimonGame(),
    );
  }
}

class SimonGame extends StatefulWidget {
  @override
  _SimonGameState createState() => _SimonGameState();
}

class _SimonGameState extends State<SimonGame> {
  Simon _simon;

  @override
  void initState() {
    super.initState();
    _simon = Simon(Random());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints.expand(),
          color: Colors.blue,
          child: Column(
            children: [
              Text(
                "Simon Says !",
                style: Theme.of(context).textTheme.headline1.copyWith(color: Colors.white),
              ),
              MaterialButton(
                child: Text("Start"),
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
