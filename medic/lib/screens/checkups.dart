import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medic/database/HCheckup.dart';
import 'package:medic/screens/checkup.dart';

class Checkups extends StatefulWidget {
  @override
  _CheckupsState createState() => _CheckupsState();
}

class _CheckupsState extends State<Checkups> {
  DBHelper dbHelper;

  @override
  void initState() {
    dbHelper = DBHelper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.green,
          child: FutureBuilder(
              future: dbHelper.getAllEntrys("1"),
              builder: (context, snapshot) {
                List<HCheckup> medices = [];

                if (snapshot.data != null) {
                  medices = snapshot.data;
                }

                return ListView.builder(
                    itemCount: medices.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 24.0, bottom: 6.0, left: 16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Checkups',
                                style: Theme.of(context)
                                    .textTheme
                                    .display1
                                    .copyWith(color: Colors.white),
                              ),
                              Text(''),
                            ],
                          ),
                        );
                      }

                      return Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: Card(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12.0,
                                    right: 12.0,
                                    top: 12.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text('Checkup'),
                                      Text(medices[index - 1].dat),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 6.0,
                                      left: 12.0,
                                      right: 12.0,
                                      bottom: 24.0),
                                  child: Text(
                                    medices[index - 1].desc,
                                    style: Theme.of(context).textTheme.subhead,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              }),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.green,
              ),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (builder) => Checkup(() {
                          setState(() {});
                        }));
              },
            ),
          ),
        )
      ],
    );
    ;
  }
}
