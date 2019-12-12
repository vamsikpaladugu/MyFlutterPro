import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as HTTP;
import 'package:magic_wall/screens/view_image.dart';

class Hot extends StatefulWidget {
  final String url;

  Hot(this.url);

  @override
  _HotState createState() => _HotState();
}

class _HotState extends State<Hot> {
  Future wallpapers;

  @override
  void initState() {
    wallpapers = HTTP.get(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: wallpapers,
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(child: CircularProgressIndicator());
        }

        List<dynamic> userMap = jsonDecode(snapshot.data.body); //['results'];

        Size size = MediaQuery.of(context).size;

        return GridView.builder(
          padding: EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: size.aspectRatio,
              crossAxisCount: 2,
              mainAxisSpacing: 3.0,
              crossAxisSpacing: 3.0),
          itemCount: userMap.length,
          itemBuilder: (context, index) {
            String imgUrl = userMap[index]['urls']['full'] + '&fit=crop&w=';

            return Hero(
              tag: 'wallpaper' + index.toString(),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ViewImage(imgUrl, imageIndex: index)));
                },
                child: Image.network(
                    '$imgUrl${size.width / 2}&h=${size.height / 2}'),
              ),
            );
          },
        );
      },
    );
  }
}

/*
*
*  child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            leading: Icon(Icons.search),
            title: Text('Hello'),
            subtitle: Text('hello'),
            trailing: Icon(Icons.people),
          );
        },
      ),
      *
      *
      *
      *
      * //        return StaggeredGridView.countBuilder(
//          padding: EdgeInsets.only(top: 3.0, left: 3.0, right: 3.0),
//          crossAxisCount: 4,
//          itemCount: 20,
//          itemBuilder: (BuildContext context, int index) => Image.network(
//              userMap[index]['urls']['full'] +
//                  '&fit=crop&w=${size.width / 2}&h=${size.height / 2}'),
//          staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 4),
//          mainAxisSpacing: 3.0,
//          crossAxisSpacing: 3.0,
//        );

* */
