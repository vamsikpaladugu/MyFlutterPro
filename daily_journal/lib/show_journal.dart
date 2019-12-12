import 'package:daily_journal/database/dbprovider.dart';
import 'package:daily_journal/database/journal.dart';
import 'package:flutter/material.dart';

class ShowJournal extends StatelessWidget {
  final Journal journal;

  ShowJournal(this.journal);

  @override
  Widget build(BuildContext context) {
    DBProvider provider = DBProvider();

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(12.0),
        child: Hero(
          tag: journal.id.toString(),
          child: Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        journal.dat.split('1Q1')[0],
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        journal.dat.split('1Q1')[1],
                        style: TextStyle(
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    journal.title.isEmpty ? 'No Title' : journal.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    journal.desc,
                  ),
                ],
              ),
            ),
          ),
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
                  'View Journal',
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  provider.delete(journal.id);

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
