import 'package:flutter/material.dart';

class TopBarContents extends StatefulWidget {
  const TopBarContents({super.key});

  @override
  State<TopBarContents> createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/logo.png",height: size.height/20,width: size.width/20,),
              SizedBox(
                width: size.width / 2,
              ),

              SizedBox(
                width: size.width / 15,
              ),
              InkWell(
                hoverColor: Colors.transparent,
                  onHover: (val) {
                    setState(() {
                      val ? _isHovering[1] = true : _isHovering[1] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 16,
                            color: _isHovering[1] ? Colors.black : Colors.black),
                      ),
                      SizedBox(height: 5,),
                      Visibility(
                        maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      visible: _isHovering[1],
                      child: Container(
                        height: 2,
                        width: 20,
                        color: Colors.white,

                      )

                      )
                    ],
                  )),
              SizedBox(
                width: size.width / 15,
              ),
              InkWell(
                  hoverColor: Colors.transparent,
                  onHover: (val) {
                    setState(() {
                      val ? _isHovering[2] = true : _isHovering[2] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 16,
                            color: _isHovering[2] ? Colors.black : Colors.black),
                      ),
                      SizedBox(height: 5,),
                      Visibility(
                          maintainAnimation: true,
                          maintainSize: true,
                          maintainState: true,
                          visible: _isHovering[2],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Colors.white,

                          )

                      )
                    ],
                  )),
              SizedBox(
                width: size.width / 15,
              ),
              InkWell(
                  hoverColor: Colors.transparent,
                  onHover: (val) {
                    setState(() {
                      val ? _isHovering[3] = true : _isHovering[3] = false;
                    });
                  },
                  onTap: () {},
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Home",
                        style: TextStyle(
                            fontSize: 16,
                            color: _isHovering[3] ? Colors.black : Colors.black),
                      ),
                      SizedBox(height: 5,),
                      Visibility(
                          maintainAnimation: true,
                          maintainSize: true,
                          maintainState: true,
                          visible: _isHovering[3],
                          child: Container(
                            height: 2,
                            width: 20,
                            color: Colors.white,

                          )

                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
