import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/side_nav.dart';
import 'package:portfolio/top_bar_contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.6),
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.20),
          child: TopBarContents()),
      // drawer: ,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
                child: Stack(
              children: [
                Image.asset(
                  "assets/heading_image.png",
                  height: size.height * 0.5,
                  width: size.width * 0.6,
                ),
                Positioned(
                    top: 100,
                    left: 200,
                    child: Image.asset(
                      "assets/linkedin-logo.png",
                      height: size.height * 0.050,
                      width: size.width * 0.050,
                    )),
                Positioned(
                    top: 200,
                    left: 200,
                    child: Image.asset(
                      "assets/github.png",
                      height: size.height * 0.050,
                      width: size.width * 0.050,
                    )),
                Positioned(
                    top: 300,
                    left: 200,
                    child: Image.asset(
                      "assets/dribbble-logo.png",
                      height: size.height * 0.050,
                      width: size.width * 0.050,
                    )),
              ],
            )),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(width: 20.0, height: 100.0),
                const Text(
                  'Hi, I\'m Ankit, A',
                  style: TextStyle(fontSize: 43.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20.0, height: 100.0),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 43.0,
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: true,
                    repeatForever: true,
                    animatedTexts: [
                      WavyAnimatedText('Developer',
                          textStyle: TextStyle(
                              fontSize: 43.0, fontWeight: FontWeight.bold)),
                   ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 100,
              width: size.width * 0.35,
              child: Text(
                "Passionate Flutter developer dedicated to crafting seamless cross-platform solutions.",
              maxLines: 5,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
