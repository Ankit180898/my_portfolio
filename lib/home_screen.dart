import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:portfolio/constants.dart';
import 'package:portfolio/top_bar_contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff222222),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 32.0),
                  child: GlassmorphicContainer(
                    height: size.height * 0.3,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "github.svg",
                              color: iconColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "linkedln.svg",
                              color: iconColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          IconButton(
                            onPressed: () {},
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
                Spacer(),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
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
                        )
                      ],
                    ),
                  ],
                ),
                Spacer()
              ],
            ),
          ],
        ));
  }
}
