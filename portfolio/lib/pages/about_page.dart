import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      padding: const EdgeInsets.all(20.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          SizedBox(height: 60.0),
          Container(
            child: Text(
              "ABOUT",
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          CustomLineStarWidget(
            borderColor: Colors.white,
          ),
          SizedBox(height: 60.0),
          _dymmyText(),
          SizedBox(height: 60.0),
        ],
      ),
    );
  }

  _dymmyText() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: SelectableText(
        "“My Name Is Bugudi Ramu And I Am A Mobile,Web Developer And Programmer Aswell.I Am From India. I Will Get My Graduation In 2020 With A Bachelor’s Degree In Electronic And Communication Engineering From Bharath Institute Of Higher Education And Research(BIHER) In Chennai(Tamilnadu). I Served My Most Of The Time In Practicing,Exploring New Ways For Solving Problems And Doing Projects.As I Am Self-Taught I'm Looking For Right Platform To Explore My Knowledge And Improve Skills.”",
        scrollPhysics: ClampingScrollPhysics(),
        style:
            TextStyle(color: Colors.white, fontSize: 16.0, letterSpacing: 1.0),
      ),
    );
  }
}
