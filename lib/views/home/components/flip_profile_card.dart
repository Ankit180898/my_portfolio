import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import '../../../res/constants.dart';

class FlipCardProfile extends StatelessWidget {
  const FlipCardProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: true,
      front: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: buttonColor.withOpacity(0.1),
              offset: const Offset(5.0, 5.0),
              blurRadius: 25.0,
              spreadRadius: 5.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white70.withOpacity(0.1),
              offset: const Offset(0.0, 0.0),
              blurRadius: 25.0,
              spreadRadius: 5.0,
            ), //BoxShadow
          ],
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/mine.jpg'),
        ),
      ),
      back: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: buttonColor.withOpacity(0.2),
              offset: const Offset(5.0, 5.0),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white70.withOpacity(0.2),
              offset: const Offset(0.0, 0.0),
              blurRadius: 20.0,
              spreadRadius: 2.0,
            ), //BoxShadow
          ],
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          backgroundColor: buttonColor,
          // Adjust the fit of the image
          child: Image.asset(
            "assets/logo.png",
            color: textColor,
            height: 30,
            filterQuality: FilterQuality.high,
            fit: BoxFit.cover,
          ), // Uncomment this line if you want the image to cover the container
        ),
      ),
    );
  }
}
