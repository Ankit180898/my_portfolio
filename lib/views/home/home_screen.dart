import 'package:flutter/material.dart';
import 'package:portfolio/views/home/components/glass_button.dart';
import 'package:portfolio/res/constants.dart';
import 'package:portfolio/views/home/components/flip_profile_card.dart';
import 'package:portfolio/views/home/components/footer_content.dart';
import 'package:portfolio/views/home/components/projects_pages.dart';
import 'package:portfolio/views/home/components/social_media_column.dart';
import 'package:portfolio/views/home/components/social_media_icon_list.dart';

import '../../res/size_helpers.dart';
import '../responsive.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: displayHeight(context),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 20),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
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
                        const SizedBox(height: 20),
                        const Responsive(
                          mobile: Center(
                              child:
                                  SocialMediaIconColumn()), // Center for mobile
                          tablet: Center(
                              child:
                                  SocialMediaIconColumn()), // Center for tablet
                          desktop: SizedBox.shrink(), // No icons for desktop
                        ),
                        const SizedBox(height: 30),
                        Responsive(
                          desktop: GlassButton(
                            height: displayHeight(context) * 0.07,
                            width: displayHeight(context) * 0.25,
                            text: "Download CV",
                            textSize: 24,
                          ),
                          tablet: GlassButton(
                            height: displayHeight(context) * 0.07,
                            width: displayHeight(context) * 0.25,
                            text: "Download CV",
                            textSize: 20,
                          ),
                          mobile: GlassButton(
                            height: displayHeight(context) * 0.07,
                            width: displayHeight(context) * 0.25,
                            textSize: 20,
                            text: "Download CV",
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Responsive(
                    desktop: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: SocialMediaIconList(),
                      ),
                    ),
                    tablet: SizedBox.shrink(),
                    mobile: SizedBox.shrink(),
                  ),
                  const Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: ScrollIndicator(),
                  ),
                ],
              ),
            ),
            const ProjectsPage(),
            const FooterContent(),
          ],
        ),
      ),
    );
  }
}

class ScrollIndicator extends StatefulWidget {
  const ScrollIndicator({super.key});

  @override
  State<ScrollIndicator> createState() => _ScrollIndicatorState();
}

class _ScrollIndicatorState extends State<ScrollIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.2),
      end: const Offset(0, 0.2),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideTransition(
          position: _slideAnimation,
          child: const Icon(
            Icons.keyboard_arrow_down,
            color: buttonColor,
            size: 32,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Scroll down to view projects',
          style: normalText(14).copyWith(
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
