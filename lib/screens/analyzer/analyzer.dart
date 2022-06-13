import 'package:cda_project/screens/widgets/analyzer_container.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../widgets/custom_mainText.dart';

class Analyzer extends StatefulWidget {
  @override
  State<Analyzer> createState() => _AnalyzerState();
}

class _AnalyzerState extends State<Analyzer> {
  late DatabaseReference _iotAnalyzer;
  num voltage = 0;
  num current = 0;
  num power = 0;
  num energy = 0;
  num frequency = 0;
  num powerFactor = 0;

  @override
  void initState() {
    _iotAnalyzer = FirebaseDatabase(
            databaseURL:
                "https://iotpoweranalyzer-5018b-default-rtdb.firebaseio.com/")
        .reference();
    _iotAnalyzer.onValue.listen((event) {
      final data = Map<String, dynamic>.from(event.snapshot.value as dynamic);
      final _voltage = data['1_Voltage_V'];
      final _current = data['2_Current_Amp'];
      final _power = data['3_Power_W'];
      final _energy = data['4_Energy_Kwh'];
      final _frequency = data['5_Frequency_Hz'];
      final _powerFactor = data['6_Powerfactor'];
      if(mounted) {
        setState(() {
          voltage = _voltage;
          current = _current;
          power = _power;
          energy = _energy;
          frequency = _frequency;
          powerFactor = _powerFactor;
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: Dimensions.sizedBox30,
                        ),
                        MyText(text: "IOT Analyzer"),
                        SizedBox(
                          height: Dimensions.sizedBox20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnalyzerContainer(
                              heading: "Voltage",
                              realtimeValue: voltage.toString(),
                            ),
                            AnalyzerContainer(
                              heading: "Current",
                              realtimeValue: current.toString(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.sizedBox20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnalyzerContainer(
                              heading: "Power",
                              realtimeValue: power.toString(),
                            ),
                            AnalyzerContainer(
                              heading: "Energy",
                              realtimeValue: energy.toString(),
                            )
                          ],
                        ),
                        SizedBox(
                          height: Dimensions.sizedBox20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnalyzerContainer(
                              heading: "Frequency",
                              realtimeValue: frequency.toString(),
                            ),
                            AnalyzerContainer(
                              heading: "Power Factor",
                              realtimeValue: powerFactor.toString(),
                            )
                          ],
                        ),
                      ]),
                )))
      ]),
    );
  }
}
