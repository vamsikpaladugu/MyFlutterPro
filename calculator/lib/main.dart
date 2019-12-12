import 'calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'number_button.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyAppMain());

class MyAppMain extends StatefulWidget {
  @override
  _MyAppMainState createState() => _MyAppMainState();
}

class _MyAppMainState extends State<MyAppMain> {
  bool isDarkTheme = true;

  Calculator calculator = Calculator();

  @override
  Widget build(BuildContext context) {
    void numberClicked(String number) {
      setState(() {
        calculator.setNumber(number);
      });
    }

    void symbolClicked(String newSymbol) {
      setState(() {
        calculator.setSymbol(newSymbol);
      });
    }

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
    ));

    return MaterialApp(
      title: 'Calculator App',
      theme: isDarkTheme ? darkTheme : lightTheme,
      home: Scaffold(
        backgroundColor:
            isDarkTheme ? backgroundColorDark : backgroundColorLight,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(250.0),
          child: Stack(
            children: <Widget>[
              AppBar(
                backgroundColor:
                    isDarkTheme ? appbarColorDark : appbarColorLight,
                centerTitle: true,
                elevation: 0.0,
                leading: IconButton(
                  icon: Opacity(
                    opacity: 0.7,
                    child: Icon(
                      isDarkTheme
                          ? FontAwesomeIcons.solidSun
                          : FontAwesomeIcons.solidMoon,
                      color: isDarkTheme ? colorDark : colorLight,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      isDarkTheme = isDarkTheme ? false : true;
                    });
                  },
                ),
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Opacity(
                    opacity: 0.7,
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Calc',
                              style: Theme.of(context).textTheme.title.copyWith(
                                  color: isDarkTheme ? colorDark : colorLight)),
                          TextSpan(
                              text: '.',
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(color: colorPrimary)),
                        ],
                      ),
                    )),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 56.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: calculator.getFirstNumber(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: isDarkTheme
                                      ? lightColorDark
                                      : lightColorLight,
                                  fontFamily: 'RobotoMonoRegular')),
                          TextSpan(
                              text: calculator.getSymbol(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: 'RobotoMonoRegular',
                                  color: colorPrimary)),
                          TextSpan(
                              text: calculator.getSecondNumber(),
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: isDarkTheme
                                      ? lightColorDark
                                      : lightColorLight,
                                  fontFamily: 'RobotoMonoRegular')),
                        ],
                      ),
                    ),
                    Text(
                      calculator.getAnswerValue(),
                      style: TextStyle(
                          fontSize: 50.0, fontFamily: 'RobotoMonoBold'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  text: 'C',
                  textColor: isDarkTheme ? lightColorDark : lightColorLight,
                  onPressed: () {
                    setState(() {
                      calculator.clear();
                    });
                  },
                ),
                NumberButton(
                  text: '+/-',
                  textColor: isDarkTheme ? lightColorDark : lightColorLight,
                  onPressed: () {
                    setState(() {
                      calculator.plusOrMinus();
                    });
                  },
                ),
                NumberButton(
                  text: '%',
                  textColor: isDarkTheme ? lightColorDark : lightColorLight,
                  onPressed: () {
                    setState(() {
                      calculator.getPercentage();
                    });
                  },
                ),
                NumberButton(
                  text: '/',
                  textColor: colorPrimary,
                  onPressed: () => symbolClicked('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  text: '7',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('7'),
                ),
                NumberButton(
                  text: '8',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('8'),
                ),
                NumberButton(
                  text: '9',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('9'),
                ),
                NumberButton(
                  text: '*',
                  textColor: colorPrimary,
                  onPressed: () => symbolClicked('*'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  text: '4',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('4'),
                ),
                NumberButton(
                  text: '5',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('5'),
                ),
                NumberButton(
                  text: '6',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('6'),
                ),
                NumberButton(
                  text: '+',
                  textColor: colorPrimary,
                  onPressed: () => symbolClicked('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  text: '1',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('1'),
                ),
                NumberButton(
                  text: '2',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('2'),
                ),
                NumberButton(
                  text: '3',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('3'),
                ),
                NumberButton(
                  textColor: colorPrimary,
                  text: '-',
                  onPressed: () => symbolClicked('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                NumberButton(
                  textColor: isDarkTheme ? lightColorDark : lightColorLight,
                  text: '00',
                  onPressed: () => numberClicked('00'),
                ),
                NumberButton(
                  text: '0',
                  textColor: isDarkTheme ? colorDark : colorLight,
                  onPressed: () => numberClicked('0'),
                ),
                NumberButton(
                  textColor: isDarkTheme ? lightColorDark : lightColorLight,
                  text: '.',
                  onPressed: () => numberClicked('.'),
                ),
                NumberButton(
                  fontSize: 24.0,
                  textColor: Colors.white,
                  backgroundColor: colorPrimary,
                  text: '=',
                  onPressed: () {
                    setState(() {
                      calculator.getAnswer();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
