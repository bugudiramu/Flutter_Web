import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/portfolio_bloc.dart';
import 'package:portfolio/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(builder: (context, theme) {
        return MaterialApp(
          title: "My Portfolio",
          debugShowCheckedModeBanner: false,
          theme: theme,
          home: HomePage(),
        );
      }),
    );
  }
}
