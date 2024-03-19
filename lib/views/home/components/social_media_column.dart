import 'package:flutter/material.dart';
import 'package:portfolio/res/size_helpers.dart';
import 'package:portfolio/views/home/components/social_icon.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaIconColumn extends StatelessWidget {
  const SocialMediaIconColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        SocialMediaIcon(
          icon: 'profile.svg',
          height: displayHeight(context) * 0.025,
          width: displayWidth(context) * 0.025,
        ),
        const Spacer(),
        SocialMediaIcon(
          icon: 'github.svg',
          onTap: () => launchUrlString("https://github.com/Ankit180898"),
          height: displayHeight(context) * 0.025,
          width: displayWidth(context) * 0.025,
        ),
        const Spacer(),
        SocialMediaIcon(
          icon: 'linkedln.svg',
          onTap: () =>
              launchUrlString("https://www.linkedin.com/in/ankitme1808/"),
          height: displayHeight(context) * 0.025,
          width: displayWidth(context) * 0.025,
        ),
        const Spacer(),
        SocialMediaIcon(
          icon: 'dribble.svg',
          onTap: () => launchUrlString("https://dribbble.com/ankit-me180898"),
          height: displayHeight(context) * 0.025,
          width: displayWidth(context) * 0.025,
        ),
        const Spacer(),
      ],
    );
  }
}
