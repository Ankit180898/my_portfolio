import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/views/splash/components/animated_loading_text.dart';

import '../../res/constants.dart';
import '../home/home_screen.dart';
import 'components/animated_container.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.offAll(const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedImageContainer(
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedLoadingText()
          ],
        ),
      ),
    );
  }
}
