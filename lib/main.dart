import 'package:demo_nav_bar_ytt/demo.dart';
import 'package:demo_nav_bar_ytt/theme.dart';
import 'package:flutter/material.dart';

import 'commons/collapsing_navigation_drawer_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Navigation Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(
        title: "demo",
      ),
    );
  }
}

class MyHomePagea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: drawerBackgroundColor,
          title: Text(
            "Collapsing Navigation Drawer/Sidebar",
          ),
        ),
        //drawer: CollapsingNavigationDrawer(),
        body: Stack(
          children: <Widget>[
            Container(
              color: selectedColor,
            ),
            CollapsingNavigationDrawer()
          ],
        ));
  }
}
