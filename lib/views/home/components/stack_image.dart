import 'package:flutter/material.dart';

class StackImage extends StatelessWidget {
  final PageController pageController;
  final int index;

  const StackImage({super.key, required this.pageController, required this.index});

  @override
  Widget build(BuildContext context) {
    final page = pageController.hasClients ? (pageController.page ?? 0) : 0;
    final percentageMoved = (page - index - 1).clamp(0.0, 1.0);

    return Positioned.fill(
      child: ClipPath(
        clipper: percentageMoved > 0 ? WaveClipper(percentageMoved) : null,
        child: Image.asset(
                    "web/assets/${index + 1}.png",
                    fit: BoxFit.cover,
      ),
      )
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  // ignore: prefer_typing_uninitialized_variables
  var percentageMoved;

  WaveClipper(this.percentageMoved);

  @override
  Path getClip(Size size) {
    final path = Path();
    final controlPoint = Offset(size.width / 2, size.height * percentageMoved);
    final endPoint = Offset(size.width, size.height);

    path.lineTo(0, size.height);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}