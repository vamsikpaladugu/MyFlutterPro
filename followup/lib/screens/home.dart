import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:followup/screens/add_client.dart';
import 'package:followup/screens/view_client.dart';

class Home extends StatefulWidget {
  final String uid;

  Home({this.uid});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var auth = FirebaseAuth.instance;

  Firestore _firestore = Firestore.instance;

  String textMessage;

  @override
  Widget build(BuildContext context) {
    String clientPath = 'users/${widget.uid}/clients';

    print(clientPath);

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddClient(
                  uid: widget.uid,
                ),
              ),
            );
          },
          label: Text('Add Client')),
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/handshake.png',
            width: 36.0,
            height: 36.0,
          ),
        ),
        title: Text('Follow UP'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              auth.signOut();
              exit(0);
            },
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore
            .collection(clientPath)
            .orderBy('followUP', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              var client = snapshot.data.documents[index];
              return ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewClient(
                        client: client.data,
                        uid: widget.uid,
                      ),
                    ),
                  );
                },
                title: Text(client['name']),
                subtitle: Text(client['update']),
                trailing: Icon(
                  Icons.adjust,
                  color: Color(int.parse(client['indictor'])),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
