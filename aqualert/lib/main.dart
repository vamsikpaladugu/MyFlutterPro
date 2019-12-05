import 'package:flutter/material.dart';

import 'daily_chart.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auea Minder',
      theme: ThemeData.dark(),
      home: Home(),
    );
  }
}
