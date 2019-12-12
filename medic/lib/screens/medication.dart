import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medic/database/HCheckup.dart';

class Medication extends StatefulWidget {
  final Function onSaved;

  Medication(this.onSaved);

  @override
  _MedicationState createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  String desc = '';
  String title = '';

  saveMedication() {
    var formatter = DateFormat('dd MMM, yyyy');

    DBHelper dbHelper = DBHelper();

    HCheckup checkup =
        HCheckup(null, desc, formatter.format(DateTime.now()), title, "0");

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
              'Add Medication',
              style: Theme.of(context).textTheme.title,
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              onChanged: (value) {
                title = value;
              },
              decoration: InputDecoration(
                isDense: true,
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 12.0,
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
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Save'),
                  onPressed: saveMedication,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
