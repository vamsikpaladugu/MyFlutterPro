import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:followup/screens/update_client.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class ViewClient extends StatefulWidget {
  final Map<String, dynamic> client;
  final String uid;

  ViewClient({this.client, this.uid});

  @override
  _ViewClientState createState() => _ViewClientState();
}

class _ViewClientState extends State<ViewClient> {
  Firestore _firestore = Firestore.instance;

  var formatter = DateFormat('MMM dd, yyyy');

  @override
  Widget build(BuildContext context) {
    String docPath = 'users/${widget.uid}/updates';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.client['name']),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(25.0))),
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => UpdateClient(
                      cid: widget.client['cId'],
                      uid: widget.uid,
                      indicator: widget.client['indictor']));
            },
          )
        ],
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
            stream: _firestore
                .collection(docPath)
                .where('cId', isEqualTo: widget.client['cId'])
                .orderBy('dat', descending: true)
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
                  var update = snapshot.data.documents[index];

                  if (index == 0)
                    return Card(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 16.0, right: 16.0, top: 24.0, bottom: 40.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Next FollowUP'),
                                  Text(
                                    formatter
                                        .format(update['followUP'].toDate()),
                                    style: Theme.of(context).textTheme.title,
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  Text('${update['message']}'),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.adjust,
                              color:
                                  Color(int.parse(widget.client['indictor'])),
                            )
                          ],
                        ),
                      ),
                    );
                  else
                    return ListTile(
                      isThreeLine: true,
                      title: Text(formatter.format(update['dat'].toDate())),
                      subtitle: Text(
                          '${update['message']}\nfollowUP: ${formatter.format(update['followUP'].toDate())}'),
                    );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.phone),
        onPressed: () {
          _launchURL(widget.client['phone']);
        },
      ),
    );
  }

  _launchURL(phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
