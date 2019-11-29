import 'package:flutter/material.dart';
import 'package:portfolio/constants/constants.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';
import 'package:random_color/random_color.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({Key key, @required this.height, @required this.width})
      : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
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
                    projectContainer(Constants.bmi),
                    projectContainer(Constants.news),
                    projectContainer(Constants.ebazaar),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.calculator),
                    projectContainer(Constants.weather),
                    projectContainer(Constants.tasklist),
                  ],
                ),
              ],
            )
          else if (width > 800 && width < 1200)
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.bmi),
                    projectContainer(Constants.news),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.ebazaar),
                    projectContainer(Constants.calculator),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    projectContainer(Constants.weather),
                    projectContainer(Constants.tasklist),
                  ],
                ),
              ],
            )
          else
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                projectContainer(Constants.bmi),
                projectContainer(Constants.news),
                projectContainer(Constants.ebazaar),
                projectContainer(Constants.calculator),
                projectContainer(Constants.weather),
                projectContainer(Constants.tasklist),
              ],
            ),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }

  Widget projectContainer(String img) {
    var randomColor = RandomColor();

    return Container(
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.colorBurn,
        color: randomColor.randomColor(),
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
    );
  }
}
