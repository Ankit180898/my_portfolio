import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:portfolio/res/size_helpers.dart';
import 'package:portfolio/views/home/components/social_icon.dart';
import 'package:portfolio/views/responsive.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SocialMediaIconColumn extends StatefulWidget {
  const SocialMediaIconColumn({super.key});

  @override
  State<SocialMediaIconColumn> createState() => _SocialMediaIconColumnState();
}

class _SocialMediaIconColumnState extends State<SocialMediaIconColumn> {
  int? hoveredIndex;

  double getScaledSize(int index) {
    const double baseSize = 0.030;
    const double maxSize = 0.045;
    const double nonHoveredMaxSize = 0.035;

    return getPropertyValue(
      index: index,
      baseValue: baseSize,
      maxValue: maxSize,
      nonHoveredMaxValue: nonHoveredMaxSize,
    );
  }

  double getTranslationX(int index) {
    const double baseTranslation = 0;
    const double maxTranslation = 20;
    const double nonHoveredMaxTranslation = 15;

    return getPropertyValue(
      index: index,
      baseValue: baseTranslation,
      maxValue: maxTranslation,
      nonHoveredMaxValue: nonHoveredMaxTranslation,
    );
  }

  double getPropertyValue({
    required int index,
    required double baseValue,
    required double maxValue,
    required double nonHoveredMaxValue,
  }) {
    if (hoveredIndex == null) return baseValue;

    final int difference = (hoveredIndex! - index).abs();
    const int itemsAffected = 4;

    if (difference == 0) return maxValue;

    if (difference <= itemsAffected) {
      final double ratio = (itemsAffected - difference) / itemsAffected;
      return lerpDouble(baseValue, nonHoveredMaxValue, ratio) ?? baseValue;
    }

    return baseValue;
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          _buildAnimatedIcon(
            0,
            'email2.svg',
            () => openEmail(email: "ankit.me180898@gmail.com"),
            context,
          ),
          const Spacer(),
          _buildAnimatedIcon(
            1,
            'github.svg',
            () => launchUrlString("https://github.com/Ankit180898"),
            context,
          ),
          const Spacer(),
          _buildAnimatedIcon(
            2,
            'linkedln.svg',
            () => launchUrlString("https://www.linkedin.com/in/ankitme1808/"),
            context,
          ),
          const Spacer(),
          _buildAnimatedIcon(
            3,
            'dribble.svg',
            () => launchUrlString("https://dribbble.com/ankit-me180898"),
            context,
          ),
          const Spacer(),
        ],
      ),
      tablet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SocialMediaIcon(
            onTap: () {
              openEmail(email: "ankit.me180898@gmail.com");
            },
            icon: 'email2.svg',
            height: displayHeight(context) * 0.030,
            width: displayWidth(context) * 0.030,
          ),
          const SizedBox(width: 16),
          SocialMediaIcon(
            icon: 'github.svg',
            onTap: () => launchUrlString("https://github.com/Ankit180898"),
            height: displayHeight(context) * 0.025,
            width: displayWidth(context) * 0.025,
          ),
          const SizedBox(width: 16),
          SocialMediaIcon(
            icon: 'linkedln.svg',
            onTap: () => launchUrlString("https://www.linkedin.com/in/ankitme1808/"),
            height: displayHeight(context) * 0.025,
            width: displayWidth(context) * 0.025,
          ),
          const SizedBox(width: 16),
          SocialMediaIcon(
            icon: 'dribble.svg',
            onTap: () => launchUrlString("https://dribbble.com/ankit-me180898"),
            height: displayHeight(context) * 0.025,
            width: displayWidth(context) * 0.025,
          ),
        ],
      ),
      mobile: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SocialMediaIcon(
            onTap: () {
              openEmail(email: "ankit.me180898@gmail.com");
            },
            icon: 'email2.svg',
            height: displayHeight(context) * 0.030,
            width: displayWidth(context) * 0.030,
          ),
          const SizedBox(width: 16),
          SocialMediaIcon(
            icon: 'github.svg',
            onTap: () => launchUrlString("https://github.com/Ankit180898"),
            height: displayHeight(context) * 0.025,
            width: displayWidth(context) * 0.025,
          ),
          const SizedBox(width: 16),
          SocialMediaIcon(
            icon: 'linkedln.svg',
            onTap: () => launchUrlString("https://www.linkedin.com/in/ankitme1808/"),
            height: displayHeight(context) * 0.025,
            width: displayWidth(context) * 0.025,
          ),
          const SizedBox(width: 16),
          SocialMediaIcon(
            icon: 'dribble.svg',
            onTap: () => launchUrlString("https://dribbble.com/ankit-me180898"),
            height: displayHeight(context) * 0.025,
            width: displayWidth(context) * 0.025,
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedIcon(
      int index, String icon, VoidCallback onTap, BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hoveredIndex = index),
      onExit: (_) => setState(() => hoveredIndex = null),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.identity()..translate(getTranslationX(index)),
        child: SocialMediaIcon(
          icon: icon,
          onTap: onTap,
          height: displayHeight(context) * getScaledSize(index),
          width: displayWidth(context) * getScaledSize(index),
        ),
      ),
    );
  }

  Future<void> openEmail({required String email}) async {
    try {
      final Uri launchUri = Uri(scheme: 'mailto', path: email);
      debugPrint('canLaunchUrl openEmail: ${await canLaunchUrl(launchUri)}');
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      }
    } catch (e) {
      debugPrint('openEmail : ${e.toString()}');
    }
  }
}
