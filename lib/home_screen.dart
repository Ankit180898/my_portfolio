import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/top_bar_contents.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var isHovering = false.obs;
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: primaryColor,
        body: Stack(children: [
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "Hi, Im Ankit ",
                      style: salutationTextStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Flutter Developer",
                      style: titleText,
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: size.height * 0.20,
                      width: size.width * 0.55,
                      child: Text(
                        "Crafting elegant and innovative Flutter applications,with captivating design for better user experiences.",
                        style: normalText,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => AnimatedContainer(
                        duration: Duration(milliseconds: 200),
                        child: InkWell(
                          onTap: () {
                            launchCVDownloadURL();
                          },
                          onHover: (val) {
                            isHovering.value = val;
                          },
                          child: GlassmorphicContainer(
                            height: size.height * 0.1,
                            width: size.width * 0.15,
                            borderRadius: 50,
                            blur: 15,
                            shape: BoxShape.circle,
                            alignment: Alignment.center,
                            border: isHovering.value ? 4 : 2,
                            linearGradient: LinearGradient(
                                colors: [
                                  Colors.white70.withOpacity(0.2),
                                  buttonColor.withOpacity(0.2)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderGradient: isHovering.value
                                ? LinearGradient(colors: [
                                    buttonColor,
                                    buttonColor,
                                  ])
                                : LinearGradient(colors: [
                                    buttonColor.withOpacity(0.2),
                                    Colors.white70.withOpacity(0.2)
                                  ]),
                            child: Text(
                              "Download CV",
                              style: normalText,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GlassmorphicContainer(
                height: size.height * 0.35,
                width: size.width * 0.04,
                borderRadius: 15,
                blur: 15,
                alignment: Alignment.center,
                border: 2,
                linearGradient: LinearGradient(colors: [
                  Colors.white.withOpacity(0.2),
                  buttonColor.withOpacity(0.2)
                ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                borderGradient: LinearGradient(colors: [
                  buttonColor.withOpacity(0.2),
                  Colors.white70.withOpacity(0.2)
                ]),
                child: Center(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          "profile.svg",
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString("https://github.com/Ankit180898");
                        },
                        icon: SvgPicture.asset(
                          "github.svg",
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString(
                              "https://www.linkedin.com/in/ankitme1808/");
                        },
                        icon: SvgPicture.asset(
                          "linkedln.svg",
                          color: iconColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      IconButton(
                        onPressed: () {
                          launchUrlString(
                              "https://dribbble.com/ankit-me180898");
                        },
                        icon: SvgPicture.asset(
                          "dribble.svg",
                          color: iconColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]));
  }

  void launchCVDownloadURL() async {
    const url =
        'https://drive.google.com/file/d/1lZJz7b190mjf756-wTrnKvPTAS4o8wPz/view?usp=drive_link';
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
      print("$url");
    } else {
      throw 'Could not launch $url';
    }
  }
}
