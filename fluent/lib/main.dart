import 'package:fluent/screens/quiz.dart';
import 'package:fluent/screens/cards.dart';
import 'package:fluent/screens/search_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'utils/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Constants.bColor,
        systemNavigationBarColor: Colors.black));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Constants.bColor,
        accentColor: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  Widget getMainWidget(index) {
    if (index == 0) {
      return Cards();
    } else if (index == 1) {
      return Quiz();
    } else {
      return SearchNew();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.bColor,
      body: getMainWidget(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        currentIndex: selectedIndex,
        backgroundColor: Constants.bColor,
        selectedItemColor: Constants.aColor,
        unselectedItemColor: Colors.black,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.casino),
            title: Text('Words'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_play),
            title: Text('Quiz'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
        ],
      ),
    );
  }
}
