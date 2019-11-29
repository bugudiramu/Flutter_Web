import 'package:flutter/material.dart';
import 'package:random_color/random_color.dart';

class CustomLineStarWidget extends StatefulWidget {
  CustomLineStarWidget({this.borderColor});
  final borderColor;

  @override
  _CustomLineStarWidgetState createState() => _CustomLineStarWidgetState();
}

class _CustomLineStarWidgetState extends State<CustomLineStarWidget> {
  var randomColor = RandomColor();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 100.0,
          color: widget.borderColor,
          height: 4.0,
        ),
        SizedBox(width: 10.0),
        Icon(
          Icons.star_half,
          color: widget.borderColor,
          size: 38.0,
        ),
        SizedBox(width: 10.0),
        Container(
          width: 100.0,
          color: widget.borderColor,
          height: 4.0,
        ),
      ],
    );
  }
}
