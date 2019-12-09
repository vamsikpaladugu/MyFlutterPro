import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medic/database/HCheckup.dart';
import 'package:medic/screens/medication.dart';

class Medic extends StatefulWidget {
  @override
  _MedicState createState() => _MedicState();
}

class _MedicState extends State<Medic> {
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
          color: Colors.red,
          child: FutureBuilder(
            future: dbHelper.getAllEntrys("0"),
            builder: (context, snapshot) {
              List<HCheckup> medices = [];

              if (snapshot.data != null) {
                medices = snapshot.data;
              }

              return ListView.builder(
                itemCount: 1 + medices.length,
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
                            'Medication',
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
                      child: GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Hey!"),
                                content:
                                    Text("You want to delete this medication?"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      dbHelper.delete(medices[index - 1].id);

                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
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
                                    Text(medices[index - 1].title),
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
                    ),
                  );
                },
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                FontAwesomeIcons.plus,
                color: Colors.red,
              ),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (builder) => Medication(() {
                    setState(() {});
                  }),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
