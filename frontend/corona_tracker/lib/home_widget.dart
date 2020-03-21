import 'package:corona_tracker/navigation/HelpScreen.dart';
import 'package:corona_tracker/navigation/MapScreen.dart';
import 'package:corona_tracker/navigation/StatusScreen.dart';
import 'package:corona_tracker/navigation/ReportScreen.dart';

import 'package:flutter/material.dart';

import 'appLocalizations.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    StatusScreen(),
    MapScreen(),
    ReportScreen(),
    HelpScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('My Flutter App'),
      ),*/
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped,
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.airline_seat_individual_suite),
            title: new Text(AppLocalizations.of(context).bottomNavigationBarStatusText),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.map),
            title: new Text(AppLocalizations.of(context).bottomNavigationBarMapText),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.report),
              title: new Text(AppLocalizations.of(context).bottomNavigationBarReportText),
          ),
          BottomNavigationBarItem(
              icon: new Icon(Icons.help),
              title: new Text(AppLocalizations.of(context).bottomNavigationBarHelpText),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}