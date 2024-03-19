import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:portfolio/res/size_helpers.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../res/constants.dart';

class DownloadButton extends StatelessWidget {
  DownloadButton({super.key, required this.isHovering});
  RxBool isHovering = false.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => InkWell(
        onTap: () {
          launchUrlString(
              'https://drive.google.com/file/d/1lZJz7b190mjf756-wTrnKvPTAS4o8wPz/view?usp=drive_link');
        },
        onHover: (val) {
          isHovering.value = val;
        },
        child: GlassmorphicContainer(
          height: displayHeight(context) * 0.07,
          width: displayWidth(context) * 0.12,
          borderRadius: displayHeight(context) * 0.50,
          blur: 15,
          alignment: Alignment.center,
          border: isHovering.value == false ? 2 : 4,
          linearGradient: isHovering.value == false
              ? LinearGradient(colors: [
                  Colors.white70.withOpacity(0.2),
                  buttonColor.withOpacity(0.2)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
              : LinearGradient(colors: [
                  buttonColor.withOpacity(0.3),
                  buttonColor.withOpacity(0.3)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          borderGradient: isHovering.value
              ? LinearGradient(colors: [buttonColor, buttonColor])
              : LinearGradient(colors: [
                  buttonColor.withOpacity(0.2),
                  Colors.white70.withOpacity(0.2)
                ]),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Download CV",
                style: normalText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
