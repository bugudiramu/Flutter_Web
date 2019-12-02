import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/pages/about_page.dart';
import 'package:portfolio/pages/contact_page.dart';
import 'package:portfolio/pages/projects_page.dart';

class AppBarWidget extends StatefulWidget {
  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      height: 80.0,
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              "Portfolio",
              style: Constants.customAppbarTitle,
            ),
          ),
          width > 800
              ? Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      navbarItems(
                        "WORK",
                        ProjectsWidget(
                          width: width,
                          height: height,
                        ),
                      ),
                      SizedBox(width: 20.0),
                      navbarItems("ABOUT", AboutPage()),
                      SizedBox(width: 20.0),
                      navbarItems("CONTACT", ContactPage()),
                      SizedBox(height: 20.0),
                      // darkmode(context)
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }

  darkmode(context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.swap_horizontal_circle,
          color: Colors.blue,
        ),
        onPressed: () {
          // * Control the DarkMode
          // BlocProvider.of<ThemeBloc>(context).add(ThemeEvent.toggle);
        },
      ),
    );
  }

  navbarItems(String s, Widget page) {
    return Container(
      child: Text(
        s,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  navbarTitle(String s) {
    return Container(
      child: Text(
        s,
        style: TextStyle(
          fontSize: 22.0,
          color: Colors.black,
        ),
      ),
    );
  }
}

// ScrollController _scrollController;
// static List<Widget> tabWidgets = [
//   MyProfileWidget(),
//   ProjectsWidget(),
//   AboutPage(),
//   ContactPage(),
//   CopyrightWidget(),
// ];
// final itemSize = tabWidgets.length.toDouble();
// @override
// void initState() {
//   super.initState();
//   _scrollController = ScrollController();
// }

// _moveDown() {
//   _scrollController.animateTo(200.0,
//       curve: Curves.linear, duration: Duration(milliseconds: 500));
// }
