import 'package:cda_project/utils/dimensions.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  Widget? child;
  double height;
  double width;

  CustomContainer({this.child, this.width = 0, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      type: MaterialType.button,
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: height == 0 ? 170 : height,
        width: width == 0 ? 170 : width,
        padding: EdgeInsets.all(Dimensions.padding10),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff6C96F9), width: 2.0),
          borderRadius: BorderRadius.circular(20),
          gradient: RadialGradient(
            center: Alignment(0.55, 0.55),
            focalRadius: 64,
            colors: [
              Colors.blueAccent,
              Colors.black,
            ],
          ),
        ),
        child: child,
      ),
    );
  }
}
