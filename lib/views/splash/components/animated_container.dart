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
    )..repeat(reverse: true);
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
          offset: Offset(0, 8 * value),
          child: Tooltip(
            message: "Logo",
            child: Container(
              height: widget.height,
              width: widget.width,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: [
                    Colors.white70.withOpacity(0.2),
                    buttonColor.withOpacity(0.2),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: buttonColor.withOpacity(0.2),
                    offset: const Offset(5.0, 5.0),
                    blurRadius: 20.0,
                    spreadRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white70.withOpacity(0.2),
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 20.0,
                    spreadRadius: 2.0,
                  ),
                ],
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  "logo.png",
                  height: 30,
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error, size: 30, color: Colors.red);
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
