import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:magic_wall/screens/search.dart';
import 'package:magic_wall/utils/urls.dart';
import 'package:http/http.dart' as HTTP;

class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  Future users;

  @override
  void initState() {
    users = HTTP.get(Urls.users);
    super.initState();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        List<dynamic> userMap = jsonDecode(snapshot.data.body); //['results'];

        Size size = MediaQuery.of(context).size;

        return GridView.builder(
          padding: EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1.5,
              crossAxisCount: 1,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0),
          itemCount: userMap.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search(
                        title: userMap[index]['title'],
                        url:
                            '${Urls.baseURLCollection}${userMap[index]['id']}${Urls.collectionPhotosEnd}'),
                  ),
                );
              },
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(''),
                    Container(
                      width: double.infinity,
                      color: Color(0x66000000),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                              userMap[index]['user']['profile_image']['small']),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        title: Text(
                          userMap[index]['user']['name'],
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(userMap[index]['title'],
                            style: TextStyle(color: Color(0x99FFFFFF))),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(userMap[index]['cover_photo']['urls']
                            ['full'] +
                        '&fit=crop&w=${size.width}&h=${size.width * 0.6667}'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
