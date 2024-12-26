import 'package:flutter/material.dart';
import 'package:portfolio/res/constants.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer({Key? key, this.height = 300, this.width = 250})
      : super(key: key);
  final double? width;
  final double? height;
  @override
  AnimatedImageContainerState createState() => AnimatedImageContainerState();
}

class AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true); // Repeat the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final value = _controller.value;
        return Transform.translate(
          offset: Offset(0, 4 * value), // Move the container up and down
          child: Container(
            height: widget.height!,
            width: widget.width!,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(colors: [
                Colors.white70.withOpacity(0.2),
                buttonColor.withOpacity(0.2)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              boxShadow: [
                BoxShadow(
                  color: buttonColor.withOpacity(0.2),
                  offset: const Offset(5.0, 5.0),
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white70.withOpacity(0.2),
                  offset: const Offset(0.0, 0.0),
                  blurRadius: 20.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
              ],
            ),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: buttonColor.withOpacity(0.1),
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 25.0,
                    spreadRadius: 5.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white70.withOpacity(0.1),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 25.0,
                    spreadRadius: 5.0,
                  ), //BoxShadow
                ],
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                "logo.png",
                height: 30,
                filterQuality: FilterQuality.high,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
