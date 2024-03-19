import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/home/components/download_button.dart';
import 'package:portfolio/views/home/components/flip_profile_card.dart';
import 'package:portfolio/views/home/components/social_media_icon_list.dart';

import '../../res/size_helpers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RxBool isHovering = false.obs;
    RxBool isSideMenuHovering = false.obs;
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const FlipCardProfile(),
                    const SizedBox(
                      height: 20,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Hi, I'm Ankit ",
                        style: salutationTextStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Flutter Developer",
                        style: titleText,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Crafting innovative Flutter applications, with captivating design \nfor better user experiences.",
                        style: normalText,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    AnimatedContainer(
                        height: displayHeight(context) * 0.05,
                        width: displayWidth(context) * 0.10,
                        duration: const Duration(milliseconds: 200),
                        child: DownloadButton(
                          isHovering: isHovering,
                        )),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: AnimatedContainer(
                  height: displayHeight(context) * 0.30,
                  width: displayWidth(context) * 0.04,
                  duration: const Duration(milliseconds: 200),
                  child: SocialMediaIconList(
                    isSideMenuHovering: isSideMenuHovering,
                  ),
                )),
          ),
        ]));
  }
}
