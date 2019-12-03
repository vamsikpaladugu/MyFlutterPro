import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:followup/screens/models/client.dart';
import 'package:intl/intl.dart';

class AddClient extends StatefulWidget {
  final String uid;

  AddClient({this.uid});

  @override
  _AddClientState createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  Client _client = Client();
  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    String clientPath = 'users/${widget.uid}/clients';
    String updatePath = 'users/${widget.uid}/updates';

    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client'),
      ),
      body: Builder(
        builder: (context) => Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  _client.name = value;

                  print(value);
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Client Name',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  _client.phone = value;
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Phone number',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  _client.email = value;
                },
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Email Id',
                    border: OutlineInputBorder()),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  _client.address = value;
                },
                keyboardType: TextInputType.text,
                minLines: 2,
                maxLines: 4,
                decoration: InputDecoration(
                    isDense: true,
                    labelText: 'Address',
                    border: OutlineInputBorder()),
              ),
              Expanded(
                child: Container(),
              ),
              RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text('Save'),
                onPressed: () {
                  print(_client.toString());

                  if (_client.name.isEmpty || _client.phone.isEmpty) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("NAme or Phone number is Empty"),
                    ));

                    return;
                  }

                  var now = DateTime.now();
                  var formatter = DateFormat('MMM dd, yyyy');
                  String formattedDate = formatter.format(now);

                  String docId =
                      _firestore.collection(clientPath).document().documentID;

                  _firestore.collection(clientPath).document(docId).setData(
                    {
                      'cId': docId,
                      'name': _client.name,
                      'phone': _client.phone,
                      'email': _client.email,
                      'followUP': now,
                      'address': _client.address,
                      'update': '$formattedDate client added',
                      'indictor': '0xFF0000FF'
                    },
                  );

                  _firestore.collection(updatePath).add(
                    {
                      'cId': docId,
                      'dat': now,
                      'message': 'client added',
                      'followUP': now
                    },
                  );

                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
