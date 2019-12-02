import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({
    Key key,
    this.height,
    this.width,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(),
      width: width,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 60.0),
                Container(
                  child: Text(
                    "PROJECTS",
                    style: Constants.secondaryTitles,
                  ),
                ),
                SizedBox(height: 10.0),
                CustomLineStarWidget(borderColor: Colors.brown.shade900),
                SizedBox(height: 60.0),
              ],
            ),
          ),
          if (width > 1200.0)
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.bmi, context),
                    projectContainer(Constants.news, context),
                    projectContainer(Constants.ebazaar, context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.calculator, context),
                    projectContainer(Constants.weather, context),
                    projectContainer(Constants.tasklist, context),
                  ],
                ),
              ],
            )
          else if (width > 700 && width < 1200)
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.bmi, context),
                    projectContainer(Constants.news, context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.ebazaar, context),
                    projectContainer(Constants.calculator, context),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.weather, context),
                    projectContainer(Constants.tasklist, context),
                  ],
                ),
              ],
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                projectContainer(Constants.bmi, context),
                projectContainer(Constants.news, context),
                projectContainer(Constants.ebazaar, context),
                projectContainer(Constants.calculator, context),
                projectContainer(Constants.weather, context),
                projectContainer(Constants.tasklist, context),
              ],
            ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }

  Widget projectContainer(String img, context) {
    var myColors = [
      Colors.black,
      Colors.blue,
      Colors.pink,
      Colors.yellow,
      Colors.grey,
      Colors.orange,
      Colors.purple,
      Colors.indigo,
      Colors.cyan,
      Colors.amber,
    ];

    Random random = Random();
    return MaterialButton(
      splashColor: Colors.transparent,
      hoverElevation: 10.0,
      onPressed: () => _showDialogAboutProject(context),
      child: Container(
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.colorBurn,
          // color: myColors[random.nextInt(6)],
          color: Colors.black,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(20.0),
        alignment: Alignment.center,
        height: 200.0,
        width: 300.0,
        child: Image.asset(
          img,
          height: 150.0,
          width: 150.0,
        ),
      ),
    );
  }

  _showDialogAboutProject(context) {
    return showDialog(
      context: context,
      child: AlertDialog(
        title: Text("Project Title"),
        content: ListTile(
          title: Text("Description of the Project"),
          subtitle: Text(
              "If you want to see the the project details head over to my GitHub profile (click the github icon below the contact section)"),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }
}
