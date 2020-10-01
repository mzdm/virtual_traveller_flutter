import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:virtual_traveller_flutter/ui/pages/flights_page.dart';
import 'package:virtual_traveller_flutter/utils/theme_utils.dart';

import 'ui/pages/home_page/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarColor: ThemeUtils.primaryDefaultColorBlue,
    ),
  );

  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currActiveTabIndex = 0;

  final _bottomNavPages = <Widget>[
    HomePage(),
    FlightPage(),
    HomePage(),
    HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeUtils.defaultDarkBlueTheme,
      home: Scaffold(
        body: _bottomNavPages[_currActiveTabIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currActiveTabIndex ?? 0,
          items: [
            BottomNavigationBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text('Flights'),
              icon: Icon(Icons.flight),
            ),
            BottomNavigationBarItem(
              title: Text('Watchlist'),
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              title: Text('Settings'),
              icon: Icon(Icons.settings),
            ),
          ],
          onTap: (index) => setState(() => _currActiveTabIndex = index),
        ),
      ),
    );
  }
}
