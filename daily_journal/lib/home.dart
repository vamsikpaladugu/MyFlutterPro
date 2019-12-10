import 'package:daily_journal/database/dbprovider.dart';
import 'package:daily_journal/database/journal.dart';
import 'package:daily_journal/show_journal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'new_journal.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DBProvider dbProvider;

  @override
  void initState() {
    dbProvider = DBProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.cyanAccent.shade400,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.cyanAccent.shade200,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return Scaffold(
      backgroundColor: Colors.cyanAccent.shade200,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.cyanAccent.shade400,
        shape: AutomaticNotchedShape(RoundedRectangleBorder(),
            StadiumBorder(side: BorderSide(color: Colors.transparent))),
        child: Container(
          height: AppBar().preferredSize.height,
        ),
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: FutureBuilder(
          future: dbProvider.getJournals(),
          builder: (context, snapshot) {
            List<Journal> journals = snapshot.data;

            if (journals == null || journals.length == 0) {
              return Center(
                child: Text('Add your first jurnal'),
              );
            }

            return ListView.builder(
              itemCount: journals.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      left: 12.0, right: 12.0, top: 6.0, bottom: 6.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ShowJournal(journals[index])));
                    },
                    child: Hero(
                      tag: journals[index].id.toString(),
                      child: Container(
                        padding: EdgeInsets.all(16.0),
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text(
                                  journals[index].dat.split('1Q1')[0],
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  journals[index].dat.split('1Q1')[1],
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
                              journals[index].title.isEmpty
                                  ? 'No Title'
                                  : journals[index].title,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 9,
                            ),
                            Text(
                              journals[index].desc,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewJournal()));
        },
        tooltip: 'Increment',
        backgroundColor: Colors.deepPurple,
        label: Text(
          'Add new jurnal',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
