import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_line_star_widget.dart';

class MyProfileWidget extends StatefulWidget {
  const MyProfileWidget({
    Key key,
    this.height,
    this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  _MyProfileWidgetState createState() => _MyProfileWidgetState();
}

class _MyProfileWidgetState extends State<MyProfileWidget>
    with SingleTickerProviderStateMixin {
  final bool opacity = false;

  Animation animation,
      delayedAnimation,
      customAnimationFromLtoC,
      customAnimation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(milliseconds: 2200), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        curve: Curves.elasticInOut, parent: animationController));
    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.75, 1.0, curve: Curves.elasticInOut)));
    customAnimationFromLtoC = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            curve: Curves.elasticInOut, parent: animationController));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (mounted) {
      animationController.forward();
    }

    final double width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) => Container(
        height: widget.height,
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
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Transform(
                  transform:
                      Matrix4.translationValues(animation.value * width, 0, 0),
                  child: Text(
                    "R",
                    style: nameStyle(),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0, widget.height * animation.value, 0),
                  child: Text(
                    "A",
                    style: nameStyle(),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      0, widget.height * customAnimationFromLtoC.value, 0),
                  child: Text(
                    "M",
                    style: nameStyle(),
                  ),
                ),
                Transform(
                  transform: Matrix4.translationValues(
                      widget.width * customAnimationFromLtoC.value, 0, 0),
                  child: Text(
                    "U",
                    style: nameStyle(),
                  ),
                ),
              ],
            )),
            SizedBox(height: 10.0),
            CustomLineStarWidget(
              borderColor: Colors.white,
            ),
            SizedBox(height: 10.0),
            Transform(
              transform: Matrix4.translationValues(
                  delayedAnimation.value * width, 0, 0),
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Flutter - Android & Computer Enthusiast.",
                  textAlign: TextAlign.center,
                  style: skillStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  nameStyle() {
    return TextStyle(
      color: Colors.white,
      fontSize: 80.0,
      fontWeight: FontWeight.bold,
    );
  }

  skillStyle() {
    return TextStyle(
        color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold);
  }
}
