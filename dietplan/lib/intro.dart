import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Intro extends StatelessWidget {
  final Function onDoneTap;

  Intro(this.onDoneTap);

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      [
        PageViewModel(
          pageColor: Colors.blue,
          iconColor: null,
          bubbleBackgroundColor: Colors.red,
          body: Text(''),
          title: Column(
            children: <Widget>[
              Text('Food'),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Keep track of your food habits',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
          mainImage: Image.asset(
            'images/diet.png',
            width: 200.0,
          ),
        ),
        PageViewModel(
          pageColor: Colors.red,
          iconColor: null,
          bubbleBackgroundColor: Colors.orange,
          body: Text(''),
          title: Column(
            children: <Widget>[
              Text('Exercise'),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Keep track of your food habits',
                style: TextStyle(fontSize: 20.0),
              )
            ],
          ),
          mainImage: Image.asset(
            'images/exercise.png',
            width: 200.0,
          ),
        ),
        PageViewModel(
          pageColor: Colors.orange,
          iconColor: null,
          bubbleBackgroundColor: Colors.white,
          body: Text(''),
          title: Column(
            children: <Widget>[
              Text('Health'),
              SizedBox(
                height: 12.0,
              ),
              Text(
                'Keep balance to maintain health',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
          mainImage: Image.asset(
            'images/health.png',
            width: 200.0,
          ),
        )
      ],
      onTapDoneButton: onDoneTap,
      showSkipButton: true,
      pageButtonTextStyles: new TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontFamily: "Regular",
      ),
    );
  }
}
