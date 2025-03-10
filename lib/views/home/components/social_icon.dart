import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/res/constants.dart';

class SocialMediaIcon extends StatelessWidget {
  const SocialMediaIcon(
      {super.key,
      required this.icon,
      this.onTap,
      required this.height,
      required this.width});
  final String icon;
  final double height;
  final double width;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: SvgPicture.asset(
        icon,
        color: textColor,
        height: height,
        width: width,
      ),
    );
  }
}
