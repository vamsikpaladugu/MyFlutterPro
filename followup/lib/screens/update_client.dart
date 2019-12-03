import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class UpdateClient extends StatefulWidget {
  final String uid;
  final String cid;
  final String indicator;

  UpdateClient({this.uid, this.cid, this.indicator});

  @override
  _UpdateClientState createState() => _UpdateClientState();
}

class _UpdateClientState extends State<UpdateClient> {
  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();

  Firestore _firestore = Firestore.instance;

  var formatter = DateFormat('MMM dd, yyyy');

  Future<Null> _selectDate(BuildContext context) async {
    now.subtract(Duration(days: 1));

    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: now.subtract(Duration(days: 1)),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  String message = '';

  Color colorSelected = Color(0xFF0000FF);

  @override
  Widget build(BuildContext context) {
    String clientPath = 'users/${widget.uid}/clients';
    String updatePath = 'users/${widget.uid}/updates';
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Builder(
        builder: (context) => Theme(
          data: ThemeData.light(),
          child: Container(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Update',
                          style: Theme.of(context).textTheme.title,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: colorSelected == Color(0xFF0000FF)
                                    ? Colors.grey
                                    : Colors.transparent)),
                        child: IconButton(
                          icon: Icon(
                            Icons.adjust,
                            color: Colors.blue,
                          ),
                          onPressed: () {
                            colorSelected = Color(0xFF0000FF);
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: colorSelected == Color(0xFF00FF00)
                                    ? Colors.grey
                                    : Colors.transparent)),
                        child: IconButton(
                          icon: Icon(
                            Icons.adjust,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            setState(() {
                              colorSelected = Color(0xFF00FF00);
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: colorSelected == Color(0xFFFF0000)
                                    ? Colors.grey
                                    : Colors.transparent)),
                        child: IconButton(
                          icon: Icon(
                            Icons.adjust,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              colorSelected = Color(0xFFFF0000);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  TextField(
                    onChanged: (value) {
                      message = value;
                    },
                    decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Message',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _selectDate(context);
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        controller: TextEditingController(
                            text: formatter.format(selectedDate)),
                        enabled: false,
                        decoration: InputDecoration(
                          isDense: true,
                          labelText: 'Next FollowUP',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FlatButton(
                      color: Color(0xFFFF0000),
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        String colors = '';
                        String colorName = '';

                        if (Color(int.parse(widget.indicator)) ==
                            colorSelected) {
                          colors = '';
                        } else {
                          if (Color(0xFFFF0000) == colorSelected) {
                            colors = '0xFFFF0000';
                            colorName = 'Red';
                          } else if (Color(0xFF00FF00) == colorSelected) {
                            colors = '0xFF00FF00';
                            colorName = 'Green';
                          } else {
                            colorName = 'Blue';
                            colors = '0xFF0000FF';
                          }
                        }

                        if (message.isEmpty && colors.isEmpty) {
                          return;
                        }

                        _firestore
                            .collection(clientPath)
                            .document(widget.cid)
                            .updateData(
                          {
                            'followUP': selectedDate,
                            'update':
                                '${formatter.format(DateTime.now())} $message',
                            'indictor':
                                colors.isEmpty ? widget.indicator : colors
                          },
                        );

                        _firestore.collection(updatePath).add(
                          {
                            'cId': widget.cid,
                            'dat': DateTime.now(),
                            'message': colors.isEmpty
                                ? message
                                : 'Indicator changed to $colorName $message',
                            'followUP': selectedDate
                          },
                        );

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void changeIndictor(colorSeleted) {}
}
