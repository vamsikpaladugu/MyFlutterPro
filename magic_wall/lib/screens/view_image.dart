import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

class ViewImage extends StatefulWidget {
  final String imageUrl;
  final int imageIndex;

  ViewImage(this.imageUrl, {this.imageIndex});

  @override
  _ViewImageState createState() => _ViewImageState();
}

class _ViewImageState extends State<ViewImage> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.transparent,
//        appBar: AppBar(
//          backgroundColor: Colors.transparent,
//        ),
        body: Stack(
          children: <Widget>[
            Hero(
              tag: 'wallpaer' + widget.imageIndex.toString(),
              child: Container(
                width: size.width,
                height: size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        '${widget.imageUrl}${size.width / 2}&h=${size.height / 2}'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Image.network(
                    '${widget.imageUrl}${size.width}&h=${size.height}'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Expanded(
                  child: Center(
                    child: Visibility(
                      visible: isVisible,
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100.0,
                  color: Color(0x66000000),
                  child: FlatButton(
                    child: Text(
                      'Set As Wallpaper',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    onPressed: () async {
                      setState(() {
                        isVisible = true;
                      });

                      String res;
                      res = await Wallpaper.homeScreen(
                          '${widget.imageUrl}${size.width * 2}&h=${size.height * 2}');

                      setState(() {
                        isVisible = false;
                      });

                      if (res == 'Home Screen Is Set Successfully!') {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
