import 'package:flutter/material.dart';
import 'package:flutter_simon/screens/components/simon_game_start_button.dart';
import 'package:flutter_simon/screens/simon_game_screen.dart';

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
