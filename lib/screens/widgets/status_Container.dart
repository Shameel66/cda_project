import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class StatusContainer extends StatelessWidget {
   StatusContainer({Key? key,required this.widget}) : super(key: key);
Widget widget;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 30,
      width: 60,
      padding: EdgeInsets.only(left: Dimensions.padding10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),
      child:widget
    );
  }
}
