import 'package:flutter/material.dart';
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
  static List<Widget> tabWidgets = [
    MyProfileWidget(),
    ProjectsWidget(),
    AboutPage(),
    ContactPage(),
    CopyrightWidget(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return ResponsiveBuilder(
      builder: (context, sizing) {
        return Scaffold(
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
          body: ListView(
            children: <Widget>[
              MyProfileWidget(
                width: width,
                height: height,
              ),
              ProjectsWidget(
                width: width,
                height: height,
              ),
              AboutPage(),
              ContactPage(),
              CopyrightWidget(),
            ],
          ),
        );
      },
    );
  }

  /*Widget _bottomNavbar() {
    return BottomNavigationBar(
      backgroundColor: Colors.green,
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      selectedIconTheme: IconThemeData(color: Colors.pink),
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.memory), title: Text("Profile")),
        BottomNavigationBarItem(
            icon: Icon(Icons.memory), title: Text("Projects")),
        BottomNavigationBarItem(icon: Icon(Icons.memory), title: Text("About")),
        BottomNavigationBarItem(
            icon: Icon(Icons.memory), title: Text("Contact")),
        BottomNavigationBarItem(icon: Icon(Icons.memory), title: Text("Links")),
      ],
    );
  }*/
}
