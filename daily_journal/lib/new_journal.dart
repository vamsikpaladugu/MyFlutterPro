import 'package:daily_journal/database/journal.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'database/dbprovider.dart';

class NewJournal extends StatefulWidget {
  @override
  _NewJournalState createState() => _NewJournalState();
}

class _NewJournalState extends State<NewJournal> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime now = DateTime.now();

  DBProvider dbProvider;

  var formatter = DateFormat("MMM dd, yyyy '•' EEE");
  var formatterTime = DateFormat('hh:mm a');
  var formatterQuery = DateFormat('ddMMyyyyHHmm');

//  Future<Null> _selectDate(BuildContext context) async {
//    now.subtract(Duration(days: 1));
//
//    final DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: selectedDate,
//        firstDate: now.subtract(Duration(days: 1)),
//        lastDate: DateTime(2101));
//    if (picked != null && picked != selectedDate)
//      setState(() {
//        selectedDate = picked;
//      });
//  }

  Future<Null> _selectTime(BuildContext context) async {
    now.subtract(Duration(days: 1));

    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != selectedTime)
      setState(() {
        selectedDate = DateTime(selectedDate.year, selectedDate.month,
            selectedDate.day, picked.hour, picked.minute);

        //selectedDate = selectedDate.subtract(duration)

        selectedTime = picked;
      });
  }

  @override
  void initState() {
    dbProvider = DBProvider();
    super.initState();
  }

  String title = '', desc = '', descError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: TextField(
                    onChanged: (value) {
                      title = value;
                    },
                    textCapitalization: TextCapitalization.sentences,
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: 'Title'),
                  ),
                ),
                SizedBox(
                  width: 6.0,
                ),
                Expanded(
                  flex: 3,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      _selectTime(context);
                    },
                    child: AbsorbPointer(
                      child: TextField(
                        controller: TextEditingController(
                            text: 'At: ${formatterTime.format(selectedDate)}'),
                        enabled: false,
                        textCapitalization: TextCapitalization.sentences,
                        style: TextStyle(fontSize: 16.0),
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Date'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              onChanged: (value) {
                desc = value;
              },
              textCapitalization: TextCapitalization.sentences,
              minLines: 3,
              maxLines: 10,
              style: TextStyle(color: Colors.black54),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color:
                      descError.isEmpty ? Colors.black54 : Colors.red.shade400,
                ),
                hintText: 'What happend today?',
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.cyanAccent.shade200,
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyanAccent.shade400,
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
        child: Container(
          height: AppBar().preferredSize.height,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                  //_modalBottomSheetMenu();
                },
              ),
              Expanded(
                child: Text(
                  'Save Journal',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              IconButton(
                icon: Icon(Icons.done),
                onPressed: () {
                  if (desc.isEmpty) {
                    setState(() {
                      descError = 'No desc';
                    });
                    return;
                  }

                  Journal journal = Journal(
                    null,
                    title,
                    formatter.format(selectedDate) +
                        "1Q1" +
                        formatterTime.format(selectedDate),
                    formatterQuery.format(selectedDate),
                    desc,
                  );

                  dbProvider.add(journal);

                  Navigator.of(context).pop();

                  //_modalBottomSheetMenu();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
