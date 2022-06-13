import 'package:cda_project/screens/details/details.dart';
import 'package:cda_project/screens/home/home.dart';
import 'package:flutter/material.dart';

import '../analyzer/analyzer.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: TabBarView(
        children: <Widget>[
          Home(),
          Analyzer(),
          Details()],
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
      ),
      bottomNavigationBar: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
          child: Container(
            color: Colors.black26,
            child: TabBar(
              labelColor: Color(0xFFC41A3B),
              unselectedLabelColor: Colors.white,
              labelStyle: TextStyle(fontSize: 10.0),
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: Colors.black54, width: 0.0),
                insets: EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 40.0),
              ),
              //For Indicator Show and Customization
              indicatorColor: Colors.black26,
              tabs: <Widget>[
                Tab(
                  icon: Icon(
                    Icons.home,
                    size: 24.0,
                  ),
                  text: 'Home',
                ),
                Tab(
                  icon: Icon(
                    Icons.category,
                    size: 24.0,
                  ),
                  text: 'Analyzer',
                ),
                Tab(
                  icon: Icon(
                    Icons.all_out,
                    size: 24.0,
                  ),
                  text: 'Details',
                ),
              ],
              controller: _tabController,
            ),
          ),
        ),
      ),
    );
  }
}
