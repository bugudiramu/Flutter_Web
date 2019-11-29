import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/portfolio_bloc.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/myprofile_page.dart';
import 'package:portfolio/pages/projects_page.dart';
import 'package:portfolio/widgets/appbar_widget.dart';
import 'package:portfolio/widgets/copyright_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'about_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(
      builder: (context, sizing) {
        return BlocProvider(
          create: (context) => ThemeBloc(),
          child: Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              title: width > 800
                  ? AppBarWidget()
                  : Text(
                      "Portfolio",
                      style: Constants.customAppbarTitle,
                    ),
            ),
            // drawer: width < 800 ? _drawerWidget() : null,

            bottomNavigationBar:
                width < 800 ? _bottomNavbar(width, height) : null,
            body: ListView(
              children: <Widget>[
                // AppBarWidget(),
                MyProfileWidget(height: height, width: width),
                ProjectsWidget(height: height, width: width),
                AboutPage(),
                ContactPage(),
                CopyrightWidget(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _drawerWidget() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _drawerItems("Home"),
          _drawerItems("Portfolio"),
          _drawerItems("About"),
          _drawerItems("Contact"),
        ],
      ),
    );
  }

  _drawerItems(String s) {
    return InkWell(
      highlightColor: Colors.grey,
      splashColor: Colors.blue,
      onTap: () {
        print("Listtile tapped!");
      },
      child: ListTile(
        title: Container(child: Text(s)),
      ),
    );
  }

  Widget _bottomNavbar(width, height) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        setState(() {
          currentIndex = index;
        });
        /*if (currentIndex == 0) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Material(
                    child: MyProfileWidget(
                      width: width,
                      height: height,
                    ),
                  )));
        } else if (currentIndex == 1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Material(child: AboutPage())));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Material(child: ContactPage())));
        }*/
      },
      selectedIconTheme: IconThemeData(color: Colors.pink),
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.memory), title: Text("Work")),
        BottomNavigationBarItem(icon: Icon(Icons.memory), title: Text("About")),
        BottomNavigationBarItem(
            icon: Icon(Icons.memory), title: Text("Contact")),
      ],
    );
  }
}

/*import 'dart:html';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';

import 'assets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  bool isDark = true;
  var opacity = false;
  int quarterTurns = 0;
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        opacity = true;
      });
    });
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));
  }

  @override
  Widget build(BuildContext context) {
    animationController.forward();

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Theme(
            data: isDark
                ? ThemeData(
                    brightness: Brightness.light, primarySwatch: Colors.green)
                : ThemeData(
                    brightness: Brightness.dark, primarySwatch: Colors.green),
            child: Scaffold(
              appBar: AppBar(
                title: Text("Flutter"),
                backgroundColor: Colors.redAccent,
                elevation: 0.0,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      icon: isDark
                          ? Image.asset(
                              Assets.moon,
                              height: 20,
                              width: 20,
                            )
                          : Icon(Icons.wb_sunny),
                      onPressed: () {
                        // setState(() {
                        //   isDark = !isDark;
                        // });
                      },
                    ),
                  )
                ],
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, animation.value * height, 0),
                    child: InkWell(
                      onTap: () {
                        animationController.reverse();
                      },
                      child: Container(
                        child: Text("hello"),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(color: Colors.black12),
                              BoxShadow(color: Colors.black87),
                              BoxShadow(color: Colors.black38),
                            ]),
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: quarterTurns,
                      child: AnimatedOpacity(
                          opacity: opacity ? 1 : 0,
                          curve: Curves.easeOut,
                          duration: Duration(milliseconds: 1800),
                          child: InkWell(
                              onTap: () {
                                setState(() {
                                  quarterTurns += 1;
                                });
                              },
                              child: Text("Flutter_Web",
                                  style: Constants.nameStyle))),
                    ),
                    /* bottomNavigationBar: BottomNavigationBar(
                                  items: const <BottomNavigationBarItem>[
                                        BottomNavigationBarItem(
                                          icon: Icon(Icons.account_circle),
                                          title: Text('Home'),
                                        ),
                                        BottomNavigationBarItem(
                                          icon: Icon(Icons.chrome_reader_mode),
                                          title: Text('About'),
                                        ),
                                        BottomNavigationBarItem(
                                          icon: Icon(Icons.mobile_screen_share),
                                          title: Text('Projects'),
                                        )
                                  ],
                                  currentIndex: selectedIndex,
                                  onTap: (index) => setState(() => selectedIndex = index),
                                  selectedItemColor: Theme.of(context).accentColor,
                                ),*/
                  ),
                ],
              ),
            ),
          );
        });
  }
}
*/
