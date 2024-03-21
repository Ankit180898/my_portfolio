import 'package:flutter/material.dart';
import 'package:portfolio/res/size_helpers.dart';
import 'package:portfolio/views/home/components/social_media_column.dart';
import '../../../res/constants.dart';

class SocialMediaIconList extends StatelessWidget {
  const SocialMediaIconList({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) * 0.30,
      width: displayWidth(context) * 0.04,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Colors.white70.withOpacity(0.2),
            buttonColor.withOpacity(0.2),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: buttonColor.withOpacity(0.2),
          width: 2,
        ),
      ),
      child: Center(child: SocialMediaIconColumn()),
    );
  }
}
