import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import 'custom_container.dart';
import 'custom_mainText.dart';

class AnalyzerContainer extends StatelessWidget {
  String heading;
  String realtimeValue;

  AnalyzerContainer({
    required this.heading,
    required this.realtimeValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(text: heading),
          SizedBox(
            height: Dimensions.sizedBox20,
          ),
          MyText(text: realtimeValue,color: Colors.red,fontSize: 34,fontWeight: FontWeight.normal,),
        ],
      ),
    );
  }
}
