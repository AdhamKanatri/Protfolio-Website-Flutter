import 'package:flutter/material.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/sections/topSection/components/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Arch.Almuhalal',
      theme: ThemeData(
        inputDecorationTheme: kDefaultInputDecorationTheme,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Menu(),
    );
  }
}

