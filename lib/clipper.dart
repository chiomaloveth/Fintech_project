import 'package:flutter/material.dart';

class CurvedTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    // Start from top-left corner
    path.moveTo(0, 0);

    // Draw to the start of the curve
    path.lineTo(size.width * 0.3, 0);

    // Create the curved indentation (going down into the container)
    path.quadraticBezierTo(
      size.width * 0.5,
      20, // Control point (middle, depth)
      size.width * 0.7,
      0, // End point
    );

    // Draw to top-right corner
    path.lineTo(size.width, 0);

    // Draw down the right side
    path.lineTo(size.width, size.height);

    // Draw across the bottom
    path.lineTo(0, size.height);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
