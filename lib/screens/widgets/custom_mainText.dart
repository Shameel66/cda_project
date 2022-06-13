import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class MyText extends StatelessWidget {
  String text;
  double fontSize;
  FontWeight fontWeight;
  Color color;

  MyText(
      {required this.text,
      this.fontSize = 0,
      this.fontWeight = FontWeight.bold,this.color=Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color==0?Colors.white:color,
          fontSize: fontSize == 0 ? Dimensions.font18 : fontSize,
          fontWeight: fontWeight == 0 ? FontWeight.bold : fontWeight),
      textAlign: TextAlign.center,
    );
  }
}
