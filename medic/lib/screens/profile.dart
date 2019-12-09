import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medic/screens/edit_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String name = '',
      age = '',
      desig = '',
      hRate = '',
      bp = '',
      diabt = '',
      cName = '',
      phone = '',
      address = '';

  getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    name = prefs.getString('name');
    age = prefs.getString('age');
    desig = prefs.getString('desig');
    hRate = prefs.getString('hRate');

    bp = prefs.getString('bp');
    diabt = prefs.getString('diabt');
    cName = prefs.getString('cName');
    phone = prefs.getString('phone');
    address = prefs.getString('address');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        SharedPreferences prefs;

        if (snapshot.data != null) {
          prefs = snapshot.data;

          name = prefs.getString('name') ?? '';
          age = prefs.getString('age') ?? '';
          desig = prefs.getString('desig') ?? '';
          hRate = prefs.getString('hRate') ?? '';

          bp = prefs.getString('bp') ?? '';
          diabt = prefs.getString('diabt') ?? '';
          cName = prefs.getString('cName') ?? '';
          phone = prefs.getString('phone') ?? '';
          address = prefs.getString('address') ?? '';
        }

        return Container(
          color: Colors.blue,
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 100.0, left: 24.0, right: 24.0),
                              child: Card(
                                child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 60.0, bottom: 40.0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          name,
                                          style:
                                              Theme.of(context).textTheme.title,
                                        ),
                                        SizedBox(
                                          height: 12.0,
                                        ),
                                        Text(
                                          '$age, $desig',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subhead,
                                        ),
                                        SizedBox(
                                          height: 6.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: CircleAvatar(
                                radius: 50.0,
                                backgroundImage: AssetImage('images/dp.jpg'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 24.0,
                                  bottom: 24.0,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text('Heart Rate'),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      '$hRate',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 24.0,
                                  bottom: 24.0,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text('BP'),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      '$bp',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 24.0,
                                  bottom: 24.0,
                                ),
                                child: Column(
                                  children: <Widget>[
                                    Text('Diab.'),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      '$diabt',
                                      style: Theme.of(context).textTheme.title,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.contacts,
                              size: 16.0,
                            ),
                          ),
                          title: Text('$cName $phone'),
                          subtitle: Text('Emergacy contact number'),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.location_on,
                              size: 16.0,
                            ),
                          ),
                          title: Text('Address'),
                          isThreeLine: true,
                          subtitle: Text(address),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    backgroundColor: Colors.white,
                    child: Icon(
                      FontAwesomeIcons.pen,
                      color: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditDetails()));
//                      showModalBottomSheet(
//                          context: context, builder: (builder) => Checkup());
                    },
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
