import 'package:flutter/material.dart';
import 'package:portfolio/res/constants.dart';
import 'package:flip_card/flip_card.dart';
import 'package:portfolio/res/size_helpers.dart';
import 'package:portfolio/views/responsive.dart';

class FlipCardProfile extends StatelessWidget {
  const FlipCardProfile({super.key});


  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: _buildFlipCard(context, widthFactor: 0.13),
      tablet: _buildFlipCard(context, widthFactor: 0.13),
      mobile: _buildFlipCard(context, widthFactor: 0.30),
    );
  }

  Widget _buildFlipCard(BuildContext context, {required double widthFactor}) {
    return FlipCard(
      flipOnTouch: true,
      front: _buildAvatarContainer(context, widthFactor),
      back: _buildLogoContainer(context, widthFactor),
    );
  }

  Widget _buildAvatarContainer(BuildContext context, double widthFactor) {
    return Container(
      width: displayWidth(context) * widthFactor,
      height: displayWidth(context) * widthFactor,
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
      child: ClipOval(
        child: Image.asset(
          "mine.jpg",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildLogoContainer(BuildContext context, double widthFactor) {
    return Container(
      width: displayWidth(context) * widthFactor,
      height: displayWidth(context) * widthFactor,
      decoration: BoxDecoration(
        color: buttonColor,
        boxShadow: [
          BoxShadow(
            color: buttonColor.withOpacity(0.2),
            offset: const Offset(5.0, 5.0),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ),
          BoxShadow(
            color: Colors.white70.withOpacity(0.2),
            offset: const Offset(0.0, 0.0),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ),
        ],
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(displayWidth(context) * 0.02),
        child: Image.asset(
          "logo.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
