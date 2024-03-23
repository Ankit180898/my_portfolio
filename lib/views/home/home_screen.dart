import 'package:flutter/material.dart';
import 'package:portfolio/views/home/components/glass_button.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/home/components/flip_profile_card.dart';
import 'package:portfolio/views/home/components/footer_content.dart';
import 'package:portfolio/views/home/components/social_media_column.dart';
import 'package:portfolio/views/home/components/social_media_icon_list.dart';

import '../../res/size_helpers.dart';
import '../responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const FlipCardProfile(),
                    const SizedBox(height: 20),
                    Responsive(
                      desktop: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Hi, I'm Ankit ",
                          style: salutationTextStyle(30),
                        ),
                      ),
                      tablet: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Hi, I'm Ankit ",
                          style: salutationTextStyle(30),
                        ),
                      ),
                      mobile: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Hi, I'm Ankit ",
                          style: salutationTextStyle(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Responsive(
                      desktop: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Flutter Developer",
                          style: titleText(72),
                          maxLines: 2,
                        ),
                      ),
                      tablet: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Flutter Developer",
                          style: titleText(64),
                          maxLines: 2,
                        ),
                      ),
                      mobile: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Flutter Developer",
                            style: titleText(58),
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Responsive(
                      desktop: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Crafting innovative Flutter applications, with captivating design \nfor better user experiences.",
                          style: normalText(20),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      tablet: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Crafting innovative Flutter applications, with captivating design \nfor better user experiences.",
                          style: normalText(20),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      mobile: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Crafting innovative Flutter applications, with captivating \ndesign for better user experiences.",
                            style: normalText(20),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Responsive(
                        desktop: GlassButton(
                          height: displayHeight(context) * 0.07,
                          width: displayWidth(context) * 0.15,
                          text: "Download CV",
                          textSize: 20,
                        ),
                        tablet: GlassButton(
                          height: displayHeight(context) * 0.07,
                          width: displayWidth(context) * 0.20,
                          text: "Download CV",
                          textSize: 16,
                        ),
                        mobile: GlassButton(
                          height: displayHeight(context) * 0.07,
                          width: displayWidth(context) * 0.30,
                          textSize: 16,
                          text: "Download CV",
                        )),
                  ],
                ),
              ],
            ),
          ),
          Responsive(
            desktop: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: SocialMediaIconList(
                  height: displayHeight(context) * 0.30,
                  width: displayWidth(context) * 0.04,
                ),
              ),
            ),
            tablet: const Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 16.0),
                  child: SocialMediaIconColumn()),
            ),
            mobile: const Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: EdgeInsets.only(right: 16.0, top: 16.0),
                  child: SocialMediaIconColumn()),
            ),
          ),
          const Positioned(bottom: 0, left: 0, right: 0, child: FooterContent())
        ],
      ),
    );
  }
}
