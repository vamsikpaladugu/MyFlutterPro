import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medic/database/HCheckup.dart';

class Checkup extends StatefulWidget {
  final Function onSaved;

  Checkup(this.onSaved);

  @override
  _CheckupState createState() => _CheckupState();
}

class _CheckupState extends State<Checkup> {
  String desc = '';

  saveCheckup() {
    var formatter = DateFormat('dd MMM, yyyy');

    DBHelper dbHelper = DBHelper();

    HCheckup checkup =
        HCheckup(null, desc, formatter.format(DateTime.now()), "", "1");

    dbHelper.add(checkup);

    widget.onSaved();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Add Checkup',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              maxLines: 4,
              onChanged: (value) {
                desc = value;
              },
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Colors.green,
                  textColor: Colors.white,
                  child: Text('Save'),
                  onPressed: saveCheckup,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
