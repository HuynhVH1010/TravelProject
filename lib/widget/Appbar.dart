import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _search = TextEditingController();
    final _key = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Form(
              child: Container(
                margin: EdgeInsets.only(top: 25, left: 15),
                width: 230,
                height: 38,
                decoration: BoxDecoration(
                  // color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: Color(0xffd3d3d3),
                        width: 3,
                        style: BorderStyle.solid)),
                child: TextFormField(
                  controller: _search,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      hintStyle: TextStyle(fontStyle: FontStyle.italic),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: 23,
                          )),
                      contentPadding: EdgeInsets.only(left: 5)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
