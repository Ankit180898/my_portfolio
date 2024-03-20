import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:portfolio/views/home/components/flip_profile_card.dart';

import '../../../res/constants.dart';
import '../../../res/size_helpers.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      height: displayHeight(context) * 0.60,
      width: displayWidth(context) * 0.30,
      borderRadius: 15,
      blur: 15,
      alignment: Alignment.center,
      border: 2,
      linearGradient: LinearGradient(colors: [
        Colors.white70.withOpacity(0.2),
        buttonColor.withOpacity(0.2)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      borderGradient: LinearGradient(colors: [
        buttonColor.withOpacity(0.2),
        Colors.white70.withOpacity(0.2)
      ]),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: displayWidth(context) * 0.10,
              height: displayWidth(context) * 0.10,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors
                    .transparent, // Set the background color to transparent
                child: ClipOval(
                  child: Image.asset(
                    "assets/mine.jpg",
                    fit: BoxFit.cover,
                    width: displayWidth(context) *
                        0.10, // Ensure width matches the container width
                    height: displayWidth(context) *
                        0.10, // Ensure height matches the container height
                  ),
                ),
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                "Ankit kumar",
                style: normalText(20),
              ),
            )
          ],
        ),
      ),
    );
  }
}
