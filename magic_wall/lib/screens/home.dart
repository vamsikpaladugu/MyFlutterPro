import 'package:flutter/material.dart';
import 'package:magic_wall/screens/collections.dart';
import 'package:magic_wall/screens/users.dart';
import 'package:magic_wall/utils/urls.dart';

import 'hot.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  int selectedNavigationIndex = 0;

  Widget getScreenWidget() {
    if (selectedNavigationIndex == 0) {
      return Hot(Urls.photos);
    } else if (selectedNavigationIndex == 1) {
      return Collections();
    } else {
      return Users();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: getScreenWidget(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedNavigationIndex = index;
          });
        },
        currentIndex: selectedNavigationIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: Text('Hot'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            title: Text('Albums'),
          ),
        ],
      ),
    );
  }
}
