import 'package:flutter/material.dart';

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
                    Container(
                      width: 144,
                      height: 144,
                      color: Colors.red[400],
                    ),
                    Container(
                      width: 144,
                      height: 144,
                      color: Colors.green[400],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 144,
                      height: 144,
                      color: Colors.blue[400],
                    ),
                    Container(
                      width: 144,
                      height: 144,
                      color: Colors.yellow[400],
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
