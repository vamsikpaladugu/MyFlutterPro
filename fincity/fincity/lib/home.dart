import 'package:fincity/Expense.dart';
import 'package:fincity/dbprovider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'add_expense.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Expense>> expenses;
  bool isUpdate = false;
  int studentIdForUpdate;
  DBProvider dbHelper;

  int tDay = DateTime.now().day + 1;

  DateTime tMonth = DateTime.now();

  var types = [
    "education",
    "dept",
    "entertainment",
    "food",
    "health",
    "relations",
    "rent",
    "shopping",
    "traval"
  ];

  var icons = ['images/'];
  var formatter = DateFormat('MMMM');
  var formatterMon = DateFormat('MMM');

  @override
  void initState() {
    super.initState();
    dbHelper = DBProvider();
    refreshStudentList();
  }

  refreshStudentList() {
    setState(() {
      expenses = dbHelper.getExpenses();
    });
  }

  @override
  Widget build(BuildContext context) {
    void _modalBottomSheetMenu() {
      showModalBottomSheet(
          context: context,
          builder: (builder) {
            return new Container(
              height: 400.0,
              color:
                  Colors.transparent, //could change this to Color(0xFF737373),
              //so you don't have to change MaterialApp canvasColor
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: PageView.builder(
                  itemCount: 12,
                  controller: PageController(),
                  itemBuilder: (context, index) {
                    DateTime month =
                        DateTime(tMonth.year, tMonth.month - index, tMonth.day);

                    return FutureBuilder(
                      future: dbHelper.getExpensesByMonth(month.month),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData || snapshot.data == null) {
                          return CircularProgressIndicator();
                        }

                        return Container(
                          padding: EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  index == 0
                                      ? "This Month"
                                      : formatter.format(month),
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(color: Colors.white),
                                ),
                                Text(
                                  "₹ ${snapshot.data}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .display3
                                      .copyWith(color: Colors.white),
                                ),
                                Container(),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            );
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddExpense()));
        },
        elevation: 2.0,
        icon: Icon(Icons.add),
        label: Text('Add Expence'),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: AutomaticNotchedShape(
            RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
        child: Container(
          height: 60.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  _modalBottomSheetMenu();
                },
              ),
              SizedBox(
                width: 12.0,
              ),
              Text(
                'Fincity',
                style: Theme.of(context).textTheme.title,
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: tDay,
        itemBuilder: (context, index) {
          int d = tDay - index;

          if (index == 0) {
            return Container();
          }

          if (index == 1) {
            return FutureBuilder(
              future: dbHelper.getAllExpensesByDay(d),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return CircularProgressIndicator();
                }

                List<Expense> amounts = snapshot.data;

                int amount = 0;

                for (int i = 0; i < amounts.length; i++) {
                  amount = amount + amounts[i].amount;
                }

                return Container(
                  padding: EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.pink,
                    child: ExpansionTile(
                      title: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, top: 24.0, bottom: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Today",
                              style: Theme.of(context)
                                  .textTheme
                                  .title
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(
                              height: 12.0,
                            ),
                            Text(
                              "₹ $amount",
                              style: Theme.of(context)
                                  .textTheme
                                  .display1
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      children: amounts.map((Expense exp) {
                        return ListTile(
                          trailing: Text(
                            '₹ ${exp.amount}',
                            style: Theme.of(context)
                                .textTheme
                                .body2
                                .copyWith(color: Colors.white),
                          ),
                          title: Text(
                            exp.name,
                            style: TextStyle(color: Colors.white),
                          ),
                          leading: Image.asset(
                            'images/' + types[exp.type] + '.png',
                            scale: 24.0,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          } else {
            return FutureBuilder(
              future: dbHelper.getAllExpensesByDay(d),
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data == null) {
                  return CircularProgressIndicator();
                }

                List<Expense> amounts = snapshot.data;

                int amount = 0;

                for (int i = 0; i < amounts.length; i++) {
                  amount = amount + amounts[i].amount;
                }
                return Container(
                  padding: EdgeInsets.only(left: 9.0, right: 9.0),
                  child: Card(
                    child: ExpansionTile(
                      title: Text('$d ${formatterMon.format(tMonth)}',
                          style: Theme.of(context).textTheme.subhead),
                      trailing: Text('₹ $amount',
                          style: Theme.of(context).textTheme.subhead),
                      children: amounts.map((Expense exp) {
                        return ListTile(
                          trailing: Text(
                            '₹ ${exp.amount}',
                            style: Theme.of(context).textTheme.body2,
                          ),
                          title: Text(exp.name),
                          leading: Image.asset(
                            'images/' + types[exp.type] + '.png',
                            scale: 24.0,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            );
          }
          //Text(stds[index].toString());
        },
      ),
    );
  }
}
