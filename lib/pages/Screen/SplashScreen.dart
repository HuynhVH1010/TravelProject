import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
//import 'package:exploreandtrip/Pages/Plane.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
import 'package:travel/pages/Screen/Plane.dart';
import 'package:travel/pages/dashboard/dashboard_page.dart';

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  State<MySplash> createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Get.to(MyLogin());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff9dec9),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // margin: EdgeInsets.only(bottom: 250),
              child: Image.asset(
                "assets/images/Splash.jpg",
                width: 300,
                height: 300,
              ),
            ).animate().fadeIn(duration: 1000.ms).scale(delay: 1000.ms),
            Container(
              // decoration: BoxDecoration(color: Colors.black),
              margin: EdgeInsets.only(bottom: 200),
              child: DefaultTextStyle(
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Lemonada"),
                child: AnimatedTextKit(
                  totalRepeatCount: 1,
                  animatedTexts: [
                    TyperAnimatedText("EXPLORE AND TRIP",
                        textAlign: TextAlign.start,
                        speed: Duration(milliseconds: 70))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
