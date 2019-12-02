import 'package:flutter/material.dart';

class WelcomeMsgPage extends StatelessWidget {
  final String name;
  final String email;
  final String msg;
  WelcomeMsgPage({this.name, this.email, this.msg});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome ${name.toUpperCase()}",
          style: Theme.of(context).textTheme.display3,
        ),
      ),
    );
  }
}
