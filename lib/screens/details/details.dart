import 'package:cda_project/screens/widgets/custom_container.dart';
import 'package:cda_project/screens/widgets/custom_mainText.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.black],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
      ),
      Container(
          padding: EdgeInsets.all(Dimensions.padding20),
          child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: SafeArea(
                child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    SizedBox(height: Dimensions.sizedBox30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(text: "Device Number"),
                              SizedBox(height: 20,),
                              MyText(text: "01",color: Colors.red,)
                            ],
                          ),
                        ),
                        CustomContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(text: "Device Location"),
                              SizedBox(height: 20,),
                              MyText(text: "CDA HQ G-6 Islamabad",color: Colors.red,)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(text: "No. of Lights"),
                              SizedBox(height: 20,),
                              MyText(text: "10",color: Colors.red,)
                            ],
                          ),
                        ),
                        CustomContainer(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyText(text: "Lights Type"),
                              SizedBox(height: 20,),
                              MyText(text: "LED 80W",color: Colors.red,)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    MyText(text: "Location"),
                    Container(
                      height: 200,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/map1.PNG"),
                          fit: BoxFit.cover
                        )
                      ),
                    )
                   ]),
                ),
              )))
    ]));
  }
}
