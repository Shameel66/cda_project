import 'dart:async';

import 'package:cda_project/screens/auth/sign_in.dart';
import 'package:cda_project/screens/landind_page/landing_page.dart';
import 'package:cda_project/utils/dimensions.dart';
import 'package:cda_project/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _currentValue = 0.0;
  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        _currentValue = _currentValue + 1;
      });
      if (_currentValue == 10) {
        _timer.cancel();
        Get.offAll(() => SignIn());
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    _timer.cancel();
    super.deactivate();
  }

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
        Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimensions.IconContainer,
                  child: Image(
                    image: AssetImage(Images.logo),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: Dimensions.sizedBox50),
                Padding(
                  padding: EdgeInsets.all(Dimensions.padding10),
                  child: Text(
                    "Capital Development Authority",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                SizedBox(
                  height: Dimensions.sizedBox50 * 2,
                ),
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.padding40, right: Dimensions.padding40),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    value: _currentValue / 10,
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
