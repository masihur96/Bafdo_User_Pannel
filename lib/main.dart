
import 'package:bafdo/pages/splash_Screen_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bafdo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          backgroundColor: Color(0xffEFF9F9),
          canvasColor: Colors.transparent),
      home: SplashScreenPage(),
    );
  }
}
