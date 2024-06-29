import 'dart:ui';

// import 'package:exploreandtrip/Pages/LoginPage.dart';
// import 'package:exploreandtrip/Pages/Plane.dart';
// import 'package:exploreandtrip/Service/Authcontroller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:travel/data/service/Authcontroller.dart';
import 'package:travel/pages/Screen/LoginManlam.dart';
//import 'package:travel/service/Authcontroller.dart';
//import 'package:velocity_x/velocity_x.dart';

class InformationPlane extends StatefulWidget {
  const InformationPlane({super.key});

  @override
  State<InformationPlane> createState() => _MyInformationState();
}

class _MyInformationState extends State<InformationPlane>
    with SingleTickerProviderStateMixin {
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
        ColorTween(begin: Colors.grey, end: Colors.red).animate(_controller);

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
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 0,
                        child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.black,
                              size: 25,
                            ))),
                    Expanded(
                        flex: 0,
                        child: Text(
                          "The Imperial Citadel of Hue",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        )),
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
                ),
                SizedBox(
                  height: 45,
                ),
                InstaImageViewer(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "assets/images/bg.jpg",
                        width: 310,
                        height: 250,
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  alignment: Alignment.topLeft,
                  child: Text(
                    "What's included ?",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 3,
                                color: Color(0xfff0f0f0),
                                style: BorderStyle.solid)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Icon(
                                Icons.flight,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Flight",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 3,
                                color: Color(0xfff0f0f0),
                                style: BorderStyle.solid)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: FaIcon(
                                FontAwesomeIcons.car,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Car",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 3,
                                color: Color(0xfff0f0f0),
                                style: BorderStyle.solid)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: FaIcon(
                                FontAwesomeIcons.ship,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Ship",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(
                                width: 3,
                                color: Color(0xfff0f0f0),
                                style: BorderStyle.solid)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Color(0xfff0f0f0),
                                  borderRadius: BorderRadius.circular(20)),
                              child: FaIcon(
                                FontAwesomeIcons.hotel,
                                color: Colors.amber,
                                size: 30,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Text(
                                "Hotel",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 23,
                                    fontWeight: FontWeight.w700),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    "About Trip",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                  // decoration: BoxDecoration(color: Colors.red),
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    "The Imperial Citadel of Hue is part of the Hue Monuments Complex, imbued with cultural, historical and architectural imprints of the Nguyen Dynasty, recognized by UNESCO as a world cultural heritage in 1993.",
                    style: TextStyle(
                        height: 2.0,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  // decoration: BoxDecoration(color: Colors.red),
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    "The Imperial Citadel of Hue is located right on the banks of the poetic and lyrical Perfume River. This is one of the relics belonging to the Hue ancient capital relic complex in the Nguyen Dynasty.",
                    style: TextStyle(
                        height: 2.0,
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    "Gallery Photo",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        InstaImageViewer(
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                "assets/images/anh1.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        InstaImageViewer(
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                "assets/images/anh2.jpg",
                                fit: BoxFit.cover,
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Stack(
                          children: [
                            InstaImageViewer(
                                child: Container(
                                  width: 120,
                                  height: 120,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Image.asset(
                                    "assets/images/anh3.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.symmetric(horizontal: 42),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Image.asset("assets/images/userAvatar.jpg"),
                      ),
                      title: Row(
                        children: [
                          Text("Man ne"),
                          SizedBox(
                            width: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                      subtitle: Text("Dai noi Hue dep vai lon"),
                      isThreeLine: true,
                      trailing: Text("Today"),
                    )),
                ElevatedButton(
                    onPressed: () async {
                      await Get.put(AuthController()).Logout(context);
                      Get.offAll(() => MyLogin());
                    },
                    child: Text("Log out"))
              ],
            ),
          ),
        );
      },
    );
  }
}
