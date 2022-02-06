import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
class displayWidget extends StatelessWidget {
  int random;
  var quotes;
   displayWidget({this.random,this.quotes});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          shadows: [
            Shadow(
              blurRadius: 7,
              color: blue,
              offset: Offset(0, 0),
            )
          ],
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(quotes[random].quote),
          ],
        ),
      ),
    );
  }
}
