import 'package:cda_project/screens/widgets/custom_container.dart';
import 'package:cda_project/screens/widgets/custom_mainText.dart';
import 'package:cda_project/screens/widgets/status_Container.dart';
import 'package:cda_project/utils/dimensions.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController onHourController = TextEditingController();
  TextEditingController onMinController = TextEditingController();
  TextEditingController offHourController = TextEditingController();
  TextEditingController offMinController = TextEditingController();
  bool _modeValue = false;
  bool _statusValue = true;
  String offTimeH = "";
  String offTimeM = "";
  String onTimeH = "";
  String onTimeM = "";
  var mode;
  String lastUpdated = '';
  String deviceTime = '';
  late DatabaseReference loadController;

  @override
  void initState() {
    loadController = FirebaseDatabase(
            databaseURL:
                'https://loadcontroller-ff28d-default-rtdb.asia-southeast1.firebasedatabase.app/')
        .reference();
    loadController.onValue.listen((event) {
      final loadController =
          Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final _autoMode = loadController['AutoMode'];
      final _lastUpdated = loadController['LastUpdateFrom'];
      final _deviceTime = loadController['DeviceTime'];
      final _offTimeH = loadController['OffTimeH'];
      final _offTimeM = loadController['OffTimeM'];
      final _onTimeH = loadController['OnTimeH'];
      final _onTimeM = loadController['OnTimeM'];
      if (mounted) {
        setState(() {
          lastUpdated = _lastUpdated;
          deviceTime = _deviceTime;
          mode = _autoMode;
          _modeValue = mode == 1 ? true : false;
          offTimeH = _offTimeH;
          offTimeM = _offTimeM;
          onTimeH = _onTimeH;
          onTimeM = _onTimeM;
        });
      }
    });
    super.initState();
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
        Container(
          padding: EdgeInsets.all(Dimensions.padding20),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: Dimensions.sizedBox30,
                  ),
                  Row(
                    children: [
                      Text(
                        "Last Updated by : ",
                        style: TextStyle(
                            color: Colors.white, fontSize: Dimensions.font18),
                      ),
                      Text(
                        "${lastUpdated} Device",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Dimensions.font18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.sizedBox20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(text: "Mode"),
                            SizedBox(
                              height: Dimensions.sizedBox20,
                            ),
                            CupertinoSwitch(
                              value: _modeValue,
                              onChanged: (value) {
                                if (value == true) {
                                  setState(() {
                                    _modeValue = true;
                                  });
                                  loadController.update({"AutoMode": 1});
                                } else {
                                  setState(() {
                                    _modeValue = false;
                                  });
                                  loadController.update({"AutoMode": 0});
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              mode == 1 ? "Auto" : "Manual",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      CustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(text: "Power Button"),
                            SizedBox(
                              height: Dimensions.sizedBox20,
                            ),
                            Image.asset(
                              "assets/images/pwr.png",
                              height: 30,
                              color: mode == 1 ? Colors.red : Colors.green,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.sizedBox30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(text: "Device Time"),
                            SizedBox(
                              height: Dimensions.sizedBox20,
                            ),
                            Text(
                              deviceTime,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.font18),
                            )
                          ],
                        ),
                      ),
                      CustomContainer(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyText(text: "Feedback Status"),
                            SizedBox(
                              height: Dimensions.sizedBox20,
                            ),
                            Text(
                              "ON / OFF",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimensions.font18),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Dimensions.sizedBox30,
                  ),
                  CustomContainer(
                    width: double.infinity,
                    height: Dimensions.customContainerHeight + 20,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            MyText(
                              text: "On Time",
                            ),
                            MyText(
                              text: "Off Time",
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.sizedBox20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      StatusContainer(
                                        widget: mode == 1
                                            ? Center(
                                                child: Text(
                                                onTimeH,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ))
                                            : TextField(
                                                controller: onHourController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.sizedBox10,
                                      ),
                                      MyText(
                                        text: "Hours",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimensions.sizedBox20,
                                  ),
                                  Column(
                                    children: [
                                      StatusContainer(
                                        widget: mode == 1
                                            ? Center(
                                                child: Text(
                                                  onTimeM,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            : TextField(
                                                controller: onMinController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.sizedBox10,
                                      ),
                                      MyText(
                                        text: "Mins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      StatusContainer(
                                        widget: mode == 1
                                            ? Center(
                                                child: Text(
                                                  offTimeH,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            : TextField(
                                                controller: offHourController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.sizedBox10,
                                      ),
                                      MyText(
                                        text: "Hours",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: Dimensions.sizedBox20,
                                  ),
                                  Column(
                                    children: [
                                      StatusContainer(
                                        widget: mode == 1
                                            ? Center(
                                                child: Text(
                                                  offTimeM,
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )
                                            : TextField(
                                                controller: offMinController,
                                                decoration: InputDecoration(
                                                    border: InputBorder.none),
                                              ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.sizedBox10,
                                      ),
                                      MyText(
                                        text: "Mins",
                                        fontSize: 14,
                                        fontWeight: FontWeight.normal,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.sizedBox10,
                        ),
                        mode == 0
                            ? RaisedButton(
                                onPressed: () {
                                  if (onHourController.text.isNotEmpty &&
                                      offHourController.text.isNotEmpty) {
                                    updateTime(
                                        onHourController.text,
                                        onMinController.text,
                                        offHourController.text,
                                        offMinController.text);
                                    print(onHourController.text);
                                  }
                                },
                                color: Colors.blueGrey,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: MyText(
                                  text: "Update",
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                ),
                              )
                            : SizedBox()
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }

  void updateTime(String updateOnHour, String updateOnMin, String updateoffHour,
      String updateoffMin) {
    loadController
        .update({
          'OffTimeH': updateoffHour,
          'OffTimeM': updateoffMin,
          'OnTimeH': updateOnHour,
          'OnTimeM': updateOnMin
        })
        .then((_) {})
        .catchError((onError) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text(onError)));
        });
  }
}
