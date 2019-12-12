import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {
  const NumberButton(
      {this.text,
      this.opacity = 1.0,
      this.textColor = Colors.white,
      this.fontSize = 20.0,
      this.backgroundColor = Colors.transparent,
      this.onPressed});

  final String text;
  final double opacity;
  final Color textColor;
  final double fontSize;
  final Color backgroundColor;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 60.0,
        height: 60.0,
        child: FlatButton(
          color: backgroundColor,
          splashColor: Colors.transparent,
          padding: EdgeInsets.all(0.0),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(120.0)),
          onPressed: onPressed,
          child: Opacity(
            opacity: opacity,
            child: Text(text,
                style: TextStyle().copyWith(
                    color: textColor,
                    fontSize: fontSize,
                    fontFamily: 'RobotoMonoRegular')),
          ),
        ));
  }
}
