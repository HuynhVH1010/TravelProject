import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:velocity_x/velocity_x.dart';

class MyReview extends StatefulWidget {
  const MyReview({super.key});

  @override
  State<MyReview> createState() => _MyReviewState();
}

final List<String> imagePaths = [
  "assets/images/bg.jpg",
  "assets/images/anh1.jpg",
  "assets/images/anh3.jpg"
];
late List<Widget> _pages;
int _activePages = 0;
final PageController controller = PageController(initialPage: 0);
Color padValue = Color(0xffd3d3d3);

class _MyReviewState extends State<MyReview> {
  TextEditingController review = TextEditingController();
  @override
  void initState() {
    super.initState();
    _pages = List.generate(
        imagePaths.length,
            (index) => ImagePlaceeHolder(
          imagePath: imagePaths[index],
        ));
  }

  @override
  Widget build(BuildContext context) {
    // Color _colorContainer = Color(0xffd3d3d3);

    void changeColor(Color value) {
      setState(() {
        padValue = value;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                    flex: 0,
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 40, horizontal: 15),
                      child: IconButton(
                          onPressed: () {},
                          icon: FaIcon(FontAwesomeIcons.arrowLeft)),
                    )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: Container(
                      child: Text(
                        "Travel Reviews",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w800,
                            fontFamily: "BreeSerif"),
                      ),
                    ))
              ],
            ),
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: imagePaths.length,
                    onPageChanged: (value) {
                      setState(() {
                        _activePages = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return _pages[index];
                    },
                  ),
                ),
                Positioned(
                    bottom: 10,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            _pages.length,
                                (index) => Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 8),
                              child: InkWell(
                                onTap: () {
                                  controller.animateToPage(index,
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeIn);
                                },
                                child: CircleAvatar(
                                  radius: 4,
                                  backgroundColor: _activePages == index
                                      ? Colors.yellow
                                      : Colors.grey,
                                ),
                              ),
                            )),
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              alignment: Alignment.topLeft,
              child: Text(
                "The Imperial Citadel of Hue",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: Colors.black,
                  ),
                ),
                Container(
                  child: Text(
                    "Hue, Viet Nam",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Rating",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "4.0",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Star Review",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: RatingBar.builder(
                initialRating: 0,
                minRating: 1,
                maxRating: 5,
                itemCount: 5,
                direction: Axis.horizontal,
                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, index) => FaIcon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (value) {
                  print(value);
                },
              ),
            ),
            // AnimatedPadding(
            //   duration: Duration(microseconds: 300),
            //   padding: EdgeInsets.symmetric(horizontal: 15),
            //   child: Container(
            //       height: 75,
            //       padding: EdgeInsets.symmetric(horizontal: 25),
            //       decoration: BoxDecoration(
            //           // color: Colors.red,
            //           borderRadius: BorderRadius.circular(20),
            //           border: Border.all(color: padValue, width: 3)),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.start,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //             size: 35,
            //           ),
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //             size: 35,
            //           ),
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //             size: 35,
            //           ),
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //             size: 35,
            //           ),
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //             size: 35,
            //           ),
            //           Icon(
            //             Icons.star,
            //             color: Colors.amber,
            //             size: 35,
            //           ),
            //         ],
            //       )),
            // ).onTap(() {
            //   changeColor(padValue == Color(0xffd3d3d3)
            //       ? Colors.green
            //       : Color(0xffd3d3d3));
            // }),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Write Review",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 360,
              height: 200,
              decoration: BoxDecoration(
                // color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                      color: Color(0xffd3d3d3),
                      width: 3,
                      style: BorderStyle.solid)),
              child: TextFormField(
                controller: review,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Padding(
                      padding: EdgeInsetsDirectional.only(start: 10, top: 10),
                      child: FaIcon(
                        FontAwesomeIcons.pen,
                        size: 18,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(10)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Submit Review",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    padding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 60)),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class ImagePlaceeHolder extends StatelessWidget {
  final String? imagePath;
  const ImagePlaceeHolder({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath!,
      fit: BoxFit.cover,
    );
  }
}
