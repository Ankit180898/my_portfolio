import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:portfolio/res/size_helpers.dart';
import 'package:portfolio/views/home/components/social_media_column.dart';

import '../../../res/constants.dart';

class SocialMediaIconList extends StatelessWidget {
  SocialMediaIconList({super.key, required this.isSideMenuHovering});
  RxBool isSideMenuHovering = false.obs;

  @override
  Widget build(BuildContext context) {
    print("${isSideMenuHovering.value}");
    return Obx(
      () => InkWell(
        onHover: (val) {
          isSideMenuHovering.value = val;
        },
        child: GlassmorphicContainer(
          height: displayHeight(context) * 0.30,
          width: displayWidth(context) * 0.04,
          borderRadius: 15,
          blur: 15,
          alignment: Alignment.center,
          border: 2,
          linearGradient: isSideMenuHovering.value == false
              ? LinearGradient(colors: [
                  Colors.white70.withOpacity(0.2),
                  buttonColor.withOpacity(0.2)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : LinearGradient(colors: [
                  buttonColor.withOpacity(0.3),
                  buttonColor.withOpacity(0.3)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderGradient: isSideMenuHovering.value
              ? LinearGradient(colors: [buttonColor, buttonColor])
              : LinearGradient(colors: [
                  buttonColor.withOpacity(0.2),
                  Colors.white70.withOpacity(0.2)
                ]),
          child: const Center(child: SocialMediaIconColumn()),
        ),
      ),
    );
  }
}
