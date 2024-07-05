import 'package:flutter/material.dart';

class Error404Page extends StatelessWidget {
  const Error404Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        return Scaffold(
          body: Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Image.asset(
              'assets/images/bg_404.png',
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
