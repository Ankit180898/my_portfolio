import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/model/project_model.dart';

const Color primaryColor = Color(0xFF181818);
const Color bgColor = Color(0xff1c77dd);

const Color buttonColor = Color(0xff69E4EC);

const Color iconColor = Color(0xffA8A8A8);
const Color textColor = Color(0xffffffff);

//30
TextStyle salutationTextStyle(double size) => GoogleFonts.poppins(
      textStyle: TextStyle(
        color: iconColor,
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
//72
TextStyle titleText(double size) => GoogleFonts.epilogue(
      textStyle: TextStyle(
        color: buttonColor,
        height: 1.2,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
//20
TextStyle normalText(double size) => GoogleFonts.poppins(
      textStyle: TextStyle(
          color: iconColor, fontSize: size, fontWeight: FontWeight.normal),
    );

final List<Project> projects = [
    Project(
      title: 'AI Chatbot Development',
      subtitle: 'Creating an Intelligent Conversational Agent',
      projectLinks: ""
    ),
    Project(
      title: 'Mobile App Development',
      subtitle: 'Building a Cross-Platform App',
      projectLinks: ""
    ),
    Project(
      title: 'Web Application Development',
      subtitle: 'Developing a Responsive Web App',
      projectLinks: ""
    ),
    Project(
      title: 'Machine Learning Model',
      subtitle: 'Training a Predictive Model',
      projectLinks: ""
    ),
    Project(
      title: 'Data Analysis Project',
      subtitle: 'Analyzing Data for Insights',
      projectLinks: ""
    ),
  ];
