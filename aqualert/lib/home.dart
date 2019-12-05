import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'daily_chart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int todayCount = 0;

  var waveHeight = [0.9, 0.8, 0.7, 0.6, 0.5, 0.4, 0.3, 0.2, 0.1, 0.1, 0.1];

  addOneGlassOfWater() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var formatterKey = DateFormat('ddMMyyyy');

    DateTime dTime = DateTime.now();

    todayCount = (prefs.getInt(formatterKey.format(dTime)) ?? 0) + 1;

    print('Hello');
    print(todayCount);

    //await prefs.setInt(formatterKey.format(dTime), 0);

    if (todayCount > 8) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hey!"),
            content: Text(
                "You have already drink 8 Glasses of water, More then that is non of my business!"),
            actions: [
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        },
      );
    } else {
      await prefs.setInt(formatterKey.format(dTime), todayCount);

      setState(() {});
    }
  }

  Future<int> getCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var formatterKey = DateFormat('ddMMyyyy');

    DateTime dTime = DateTime.now();

    return prefs.getInt(formatterKey.format(dTime)) ?? 0;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF303030),
      body: FutureBuilder(
          future: getCount(),
          builder: (context, snapshot) {
            int count = snapshot.data;
            print(count);

            print(waveHeight[count]);

            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                AppBar(
                  title: const Text('Aqua Minder'),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.insert_chart),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CustomRoundedBars()));
                      },
                    )
                  ],
                  elevation: 0.0,
                  centerTitle: false,
                ),
                Stack(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        width: 240.0,
                        height: 350.0,
                        child: WaveWidget(
                          config: CustomConfig(
                            colors: [
                              Colors.blue,
                              Colors.lightBlue,
                              Colors.blueAccent,
                            ],
                            durations: [20000, 35000, 50000],
                            heightPercentages: [
                              waveHeight[count],
                              waveHeight[count],
                              waveHeight[count]
                            ],
                          ),
                          waveAmplitude: 0,
                          backgroundColor: Color(0x99d1efff),
                          size: Size(250.0, 342.0),
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/drop_four.png',
                        height: 370.0,
                        width: 300.0,
                      ),
                    ),
                    Positioned(
                      top: 78.0,
                      right: 48.0,
                      child: SpinKitPulse(
                        color: Colors.blue,
                        size: 100.0,
                        controller: AnimationController(
                            vsync: this,
                            duration: const Duration(milliseconds: 1200)),
                      ),
                    ),
                    Positioned(
                      top: 100.0,
                      right: 70.0,
                      child: FloatingActionButton(
                        onPressed: () {
                          print('a');
                          addOneGlassOfWater();
                        },
                        backgroundColor: Colors.lightBlue,
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Image.asset(
                            'assets/images/glass.png',
                            width: 24.0,
                            height: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '$count/8 Cups',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text('250ML each', style: TextStyle()),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              '2000 ML',
                              style: TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text('Daily Goal', style: TextStyle())
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50.0,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: 8,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            count > index
                                ? 'assets/images/glass.png'
                                : 'assets/images/glass_empty_one.png',
                            width: 40.0,
                            height: 40.0,
                          );
                        },
                      ),

//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//              children: <Widget>[
//                Image.asset(
//                  'assets/images/glass.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass_empty_one.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass_empty_one.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass_empty_one.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass_empty_one.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass_empty_one.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//                Image.asset(
//                  'assets/images/glass_empty_one.png',
//                  width: 40.0,
//                  height: 40.0,
//                ),
//              ],
//            ),
                    ),
                  ),
                )
              ],
            );
          }),
    );
  }
}
