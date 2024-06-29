import 'dart:ui';
// import 'package:exploreandtrip/Pages/InformationPlane.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:travel/pages/Screen/InfomationPlane.dart';

class Plane extends StatefulWidget {
  const Plane({super.key});

  @override
  State<Plane> createState() => _MyPlaneState();
}

class _MyPlaneState extends State<Plane> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimated;
  late Animation<double> _sizeAnimated;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    _colorAnimated =
        ColorTween(begin: Colors.white, end: Colors.red).animate(_controller);

    _sizeAnimated = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 50, end: 30), weight: 50)
    ]).animate(_controller);

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimated.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      } else {
        isFav = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
            body: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  "assets/images/bg.jpg",
                  fit: BoxFit.cover,
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1.7, sigmaY: 1.7),
                  child: Container(
                    child: Text(""),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                    // decoration: BoxDecoration(color: Colors.red),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 0,
                            child: IconButton(
                                onPressed: () {},
                                icon: FaIcon(
                                  FontAwesomeIcons.arrowLeft,
                                  color: Colors.white,
                                  size: 25,
                                ))),
                        Expanded(
                          flex: 0,
                          child: IconButton(
                              onPressed: () {
                                isFav
                                    ? _controller.reverse()
                                    : _controller.forward();
                              },
                              icon: Icon(Icons.favorite,
                                  color: _colorAnimated.value,
                                  size: _sizeAnimated.value)),
                        )
                      ],
                    )),
                Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      alignment: Alignment.topCenter,
                      padding: EdgeInsets.only(left: 15, right: 15),
                      margin: EdgeInsets.only(top: 150),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 8,
                      child: Text(
                        "The Imperial Citadel of Hue",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Hue, VietNam",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      // decoration: BoxDecoration(color: Colors.red),
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "The Imperial Citadel of Hue is part of the Hue Monuments Complex, imbued with cultural, historical and architectural imprints of the Nguyen Dynasty, recognized by UNESCO as a world cultural heritage in 1993.",
                        style: TextStyle(
                            height: 2.0,
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    SizedBox(
                      height: 70,
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          onPressed: () {
                            Get.to(InformationPlane());
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowDown,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ],
            ));
      },
    );
  }
}
