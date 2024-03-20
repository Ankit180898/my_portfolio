import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../res/constants.dart';
import '../../../res/size_helpers.dart';
import '../../responsive.dart';
import 'social_icon.dart';

class FooterContent extends StatelessWidget {
  const FooterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Responsive(
        desktop: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 0.1,
                color: iconColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "© 2024 Ankit Kumar. All rights reserved.",
                style: normalText(15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    launchUrlString(
                        "https://github.com/Ankit180898/my_portfolio");
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "View Source",
                        style: normalText(15),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SocialMediaIcon(
                          icon: 'github.svg',
                          height: displayHeight(context) * 0.02,
                          width: displayWidth(context) * 0.02),
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        mobile: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 0.1,
                color: iconColor,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "© 2024 Ankit Kumar. All rights reserved.",
                style: normalText(15),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    launchUrlString(
                        "https://github.com/Ankit180898/my_portfolio");
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "View Source",
                        style: normalText(15),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SocialMediaIcon(
                          icon: 'github.svg',
                          height: displayHeight(context) * 0.02,
                          width: displayWidth(context) * 0.02),
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
        tablet: Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Divider(
                  thickness: 0.1,
                  color: iconColor,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "© 2024 Ankit Kumar. All rights reserved.",
                  style: normalText(15),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextButton(
                    onPressed: () {
                      launchUrlString(
                          "https://github.com/Ankit180898/my_portfolio");
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "View Source",
                          style: normalText(15),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SocialMediaIcon(
                            icon: 'github.svg',
                            height: displayHeight(context) * 0.015,
                            width: displayWidth(context) * 0.015),
                      ],
                    )),
                const SizedBox(
                  height: 5,
                ),
              ],
            )));
  }
}
