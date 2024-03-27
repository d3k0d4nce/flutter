import 'package:flutter/material.dart';
import 'package:fourth_lab/pages/first_screen.dart';
import 'package:fourth_lab/pages/second_screen.dart';
import 'package:fourth_lab/pages/third_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.white
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => FirstScreen(),
      '/second': (context) => SecondScreen(),
      '/third': (context) => ThirdScreen(),
    },
  ));
}
