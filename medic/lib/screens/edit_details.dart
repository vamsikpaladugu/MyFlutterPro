import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditDetails extends StatefulWidget {
  @override
  _EditDetailsState createState() => _EditDetailsState();
}

class _EditDetailsState extends State<EditDetails> {
  int todayCount = 0;

  String name = '',
      age = '',
      desig = '',
      hRate = '',
      bp = '',
      diabt = '',
      cName = '',
      phone = '',
      address = '';

  Future addOneGlassOfWater(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (name.isEmpty ||
        age.isEmpty ||
        desig.isEmpty ||
        hRate.isEmpty ||
        bp.isEmpty ||
        diabt.isEmpty ||
        cName.isEmpty ||
        phone.isEmpty ||
        address.isEmpty) {
      return;
    } else {
      await prefs.setString('name', name);
      await prefs.setString('age', age);
      await prefs.setString('desig', desig);
      await prefs.setString('hRate', hRate);
      await prefs.setString('bp', bp);

      await prefs.setString('diabt', diabt);
      await prefs.setString('cName', cName);
      await prefs.setString('phone', phone);
      await prefs.setString('address', address);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Details'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.done,
              color: Colors.white,
            ),
            onPressed: () {
              addOneGlassOfWater(context);
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Personal Details:',
                style: Theme.of(context).textTheme.subhead,
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                onChanged: (value) {
                  age = value;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Age',
                  suffixText: 'Years',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                onChanged: (value) {
                  desig = value;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Degination',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        hRate = value;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'H Rate',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        bp = value;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'BP',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        diabt = value;
                      },
                      decoration: InputDecoration(
                        isDense: true,
                        labelText: 'Diabt.',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12.0,
              ),
              Divider(),
              Text(
                'Emergancy Contact:',
                style: Theme.of(context).textTheme.subhead,
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                onChanged: (value) {
                  cName = value;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Contact Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                onChanged: (value) {
                  phone = value;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Phone number',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              TextField(
                onChanged: (value) {
                  address = value;
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Your Address',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
