import 'package:flutter/material.dart';
import 'package:portfolio/widgets/appbar_widget.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';

class MyProfileWidget extends StatelessWidget {
  const MyProfileWidget({
    Key key,
    @required this.height,
    @required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  final bool opacity = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      // alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.pink.shade700,
            Colors.pink,
            Colors.pink.shade700,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              "RAMU",
              style: nameStyle(),
            ),
          ),
          SizedBox(height: 10.0),
          CustomLineStarWidget(
            borderColor: Colors.white,
          ),
          SizedBox(height: 10.0),
          Container(
            child: Text(
              "Flutter - Android & Computer Enthusiast.",
              style: skillStyle(),
            ),
          ),
        ],
      ),
    );
  }

  nameStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 80.0, fontWeight: FontWeight.bold);
  }

  skillStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold);
  }
}
