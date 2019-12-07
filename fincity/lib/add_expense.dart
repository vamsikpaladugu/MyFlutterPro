import 'package:fincity/Expense.dart';
import 'package:fincity/dbprovider.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatefulWidget {
  @override
  _AddExpenseState createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  //dbHelper.add(Student(null, _studentName));

  String dropdownValue = '0';
  String desc = '';
  int amount = 0;
  String amountError = '';

  var _currencies = [
    "Education",
    "Dept",
    "Entertainment",
    "Food",
    "Health",
    "Relations",
    "Rent",
    "Shopping",
    "Traval"
  ];

  DBProvider dbHelper;

  @override
  void initState() {
    super.initState();
    dbHelper = DBProvider();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) => Container(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Fincity',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Manage your expences on the go',
                  style: Theme.of(context).textTheme.body1,
                ),
                Expanded(
                  child: Container(),
                ),
                InputDecorator(
                  decoration: InputDecoration(
                      errorStyle:
                          TextStyle(color: Colors.redAccent, fontSize: 16.0),
                      labelText: 'Select Expense',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      isDense: true,
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: _currencies.indexOf(value).toString(),
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      try {
                        amount = int.parse(value);
                        amountError = null;
                      } catch (e) {
                        amountError = 'Not a number';
                      }
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      errorText: amountError,
                      border: OutlineInputBorder(),
                      labelText: 'Amount',
                      prefix: Text('₹ ')),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  onChanged: (value) {
                    desc = value;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          shape: AutomaticNotchedShape(
              RoundedRectangleBorder(), StadiumBorder(side: BorderSide())),
          child: Container(
            height: 60.0,
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
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  'Add Expence',
                  style: Theme.of(context).textTheme.title,
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  icon: Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    DateTime dt = DateTime.now();

                    if (desc.isEmpty || amount == 0) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text('Field shouldt be Empty'),
                      ));

                      return;
                    }

                    Expense exp = Expense(null, desc, int.parse(dropdownValue),
                        amount, dt.day, dt.month, dt.year);

                    print(exp);

                    dbHelper.add(exp);

                    Navigator.of(context).pop();
                    //_modalBottomSheetMenu();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
