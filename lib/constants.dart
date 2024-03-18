import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color primaryColor = Color.fromARGB(255, 24, 24, 24);
const Color bgColor = Color(0xff1c77dd);

const Color buttonColor = Color(0xff69E4EC);

const Color iconColor = Color(0xffA8A8A8);
const Color textColor = Color(0xffffffff);

var salutationTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    color: iconColor,
    fontSize: 40,
    fontWeight: FontWeight.w600,
  ),
);
var titleText = GoogleFonts.epilogue(
  textStyle: const TextStyle(
    color: buttonColor,
    height: 1.2,
    fontSize: 80,
    fontWeight: FontWeight.bold,
  ),
);
var normalText = GoogleFonts.poppins(
  textStyle: const TextStyle(
      color: iconColor, fontSize: 24, fontWeight: FontWeight.normal),
);
