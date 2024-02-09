import 'package:flutter/material.dart';
import 'package:portfolio/side_nav.dart';
import 'package:portfolio/top_bar_contents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size(size.width, size.height*0.20) ,
        child: TopBarContents()

      ),
      // drawer: ,
      body: Column(
        children: [
          Center(child:  Image.asset("assets/heading_image.png",height:size.height * 0.7,width: size.width * 0.7,)),

        ],
      ),
    );
  }
}
