// In constants.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Color Scheme
const Color primaryColor = Color(0xFF1E1E1E);
const Color secondaryColor = Color(0xFF2D2D2D);
const Color accentColor = Color(0xFF64FFDA);  // Similar to shorebird.dev accent
const Color buttonColor = Color(0xFF64FFDA);
const Color textColor = Colors.white;
const Color textSecondaryColor = Color(0xFFAAAAAA);

// Typography
TextStyle headingText(double size) => GoogleFonts.poppins(
  fontSize: size,
  fontWeight: FontWeight.bold,
  color: textColor,
  letterSpacing: -0.5,
);

TextStyle titleText(double size) => GoogleFonts.poppins(
  fontSize: size,
  fontWeight: FontWeight.w600,
  color: textColor,
  letterSpacing: -0.5,
);

TextStyle salutationTextStyle(double size) => GoogleFonts.poppins(
  fontSize: size,
  fontWeight: FontWeight.w500,
  color: accentColor,
);

TextStyle normalText(double size, {Color textColor = Colors.white}) => GoogleFonts.inter(
  fontSize: size,
  color: textColor,
  fontWeight: FontWeight.w400,
);

// Spacing
const double kDefaultPadding = 20.0;
const double kDefaultMargin = 20.0;