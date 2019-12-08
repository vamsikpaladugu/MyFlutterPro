import 'package:dietplan/database/entry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database/dbhelper.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DBHelper dbHelper;

  DateTime dTime = DateTime.now();

  var formatter = DateFormat('ddMMyyyy');
  var formatterDay = DateFormat('MMM dd');

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    List<String> options = [
      "images/bav.png",
      "images/meals.png",
      "images/snacks.png",
      "images/activity.png",
      "images/playing.png",
    ];

    List<String> optionTitles = [
      "Beverages",
      "Meals",
      "Snacks",
      "Activity",
      "Playing",
    ];

    var calories = [
      "50",
      "100",
      "200",
      "300",
      "400",
      "500",
      "600",
      "700",
      "800",
      "900",
      "1000"
    ];

    void _modalBottomSheetMenu() {
      showModalBottomSheet(
          context: context, builder: (builder) => BottomSheet());
    }

    return PageView.builder(
      controller: PageController(),
      itemBuilder: (context, index) {
        DateTime ind = dTime.subtract(Duration(days: index));

        return FutureBuilder(
            future: dbHelper.getAllEntrys(formatter.format(ind)),
            builder: (context, snapshot) {
              int tCal = 0;

//              if (snapshot.data == null) {
//                return Scaffold(
//                  body: Center(
//                    child: CircularProgressIndicator(),
//                  ),
//                );
//              }

              List<Entry> entries = snapshot.data;

              if (entries != null) {
                print(entries.length);
                print(formatter.format(ind));
              } else {
                print('null');
              }
              return DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: AppBar(
                    actions: index == 0
                        ? <Widget>[
                            IconButton(
                              onPressed: () {
                                _modalBottomSheetMenu();
                              },
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            )
                          ]
                        : null,
                    backgroundColor: Colors.red,
                    elevation: 0.0,
                    bottom: PreferredSize(
                      preferredSize: Size(double.infinity, 280.0),
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 180.0,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                            ),
                            padding: EdgeInsets.only(
                                top: 24.0, left: 24.0, bottom: 50.0),
                            width: double.infinity,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.ideographic,
                                  children: <Widget>[
                                    Text(
                                      tCal.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .display1
                                          .copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 60.0),
                                    ),
                                    Text(
                                      'kcal.',
                                      style: Theme.of(context)
                                          .textTheme
                                          .title
                                          .copyWith(color: Color(0x66FFFFFF)),
                                    ),
                                  ],
                                ),
                                Text(
                                  index == 0
                                      ? 'Today'
                                      : formatterDay.format(ind),
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(color: Color(0xDDFFFFFF)),
                                ),
                              ],
                            ),
                          ),
                          TabBar(
                            indicatorColor: Colors.orange,
                            indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0))),
                            isScrollable: true,
                            tabs: [
                              Container(
                                height: 100.0,
                                width: 100.0,
                                padding:
                                    EdgeInsets.only(bottom: 24.0, top: 12.0),
                                child: Image.asset(
                                  'images/diet.png',
                                  height: 30.0,
                                ),
                              ),
                              Container(
                                height: 100.0,
                                width: 100.0,
                                padding:
                                    EdgeInsets.only(bottom: 24.0, top: 12.0),
                                child: Image.asset(
                                  'images/exercise.png',
                                  height: 30.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(
                    children: [
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  bottom: 12.0,
                                  left: 6.0,
                                  right: 6.0),
                              width: 250.0,
                              child: Center(
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(24.0),
                                    width: 250.0,
                                    height: double.infinity,
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Image.asset(
                                            options[0],
                                            height: 50.0,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Text(
                                            '200 kcal',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(),
                                          ),
                                          Divider(
                                            color: Colors.red,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Text(
                                            'Tea, 6.30AM',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                      ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(50.0),
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  top: 12.0,
                                  bottom: 12.0,
                                  left: 6.0,
                                  right: 6.0),
                              width: 250.0,
                              child: Center(
                                child: Card(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(50.0),
                                      ),
                                    ),
                                    padding: EdgeInsets.all(24.0),
                                    width: 250.0,
                                    height: double.infinity,
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Image.asset(
                                            options[3],
                                            height: 50.0,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Text(
                                            '200 kcal',
                                            style: TextStyle(
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Expanded(
                                            flex: 8,
                                            child: Container(),
                                          ),
                                          Divider(
                                            color: Colors.red,
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(),
                                          ),
                                          Text(
                                            'Activity, 4.25 PM',
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              );
            });
      },
    );
  }
}

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  String dropdownValue = '50';

  List<String> options = [
    "images/bav.png",
    "images/meals.png",
    "images/snacks.png",
    "images/activity.png",
    "images/playing.png",
  ];

  List<String> optionTitles = [
    "Beverages",
    "Meals",
    "Snacks",
    "Activity",
    "Playing",
  ];

  var calories = [
    "50",
    "100",
    "200",
    "300",
    "400",
    "500",
    "600",
    "700",
    "800",
    "900",
    "1000"
  ];

  DBHelper dbHelper;

  DateTime dTime = DateTime.now();
  var formatter = DateFormat('ddMMyyyy');

  var formatterTime = DateFormat('hh: mm a');

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, //could change this to Color(0xFF737373),
      //so you don't have to change MaterialApp canvasColor
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 12.0,
              ),
              Container(
                height: 350.0,
                child: PageView.builder(
                  itemCount: options.length,
                  controller: PageController(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8.0),
                      child: Card(
                        color: index < 3 ? Colors.amber.shade900 : Colors.green,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              width: 100.0,
                              child: InputDecorator(
                                decoration: InputDecoration(
                                  focusColor: Colors.white,
                                  errorStyle: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12.0,
                                  ),
                                  labelText: 'In kcal',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: dropdownValue,
                                    isDense: true,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        dropdownValue = newValue;
                                      });
                                    },
                                    items: calories.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            ),
                            Image.asset(
                              options[index],
                              height: 100.0,
                              width: 100.0,
                            ),
                            Text(
                              optionTitles[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(color: Colors.black),
                            ),
                            RaisedButton(
                              onPressed: () {
                                Entry entry = Entry(
                                    null,
                                    index,
                                    int.parse(dropdownValue),
                                    index < 3 ? 0 : 1,
                                    formatterTime.format(dTime),
                                    formatter.format(dTime));

                                print(entry);

                                dbHelper.add(entry);

                                Navigator.of(context).pop();
                              },
                              child: Text('Add Item'),
                            ),
                            Container(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
