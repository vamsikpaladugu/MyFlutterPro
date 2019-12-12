import 'package:flutter/material.dart';

class ViewProduct extends StatefulWidget {
  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton.extended(
            backgroundColor: Colors.blue,
            icon: Icon(
              Icons.add_shopping_cart,
              color: Colors.white,
            ),
            onPressed: () {
              Scaffold.of(context).showSnackBar(
                  new SnackBar(content: new Text("Added to cart")));
            },
            label: Text(
              '   Add To Cart',
              style: TextStyle(color: Colors.white),
            )),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              primary: true,
              expandedHeight: 350.0,
              backgroundColor: Colors.white,
              elevation: 0.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/watch/r3.jpg",
                      height: 250.0,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              )),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Titan TS20199',
                      style: Theme.of(context).textTheme.title,
                    ),
                    Text(
                      '₹ 2,900',
                      style: Theme.of(context).textTheme.headline.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  'Smart and stylish - the Gionee Smart Life smartwatch is just what you need to keep track of your health and more.',
                  style: Theme.of(context).textTheme.body1,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 40.0,
                      color: Colors.yellow.shade700,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Text(
                      '4.2 | 234 Reviews',
                      style: Theme.of(context)
                          .textTheme
                          .subhead
                          .copyWith(fontSize: 16.0),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Specificatins',
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 18.0),
                ),
                Table(children: [
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Sales Package:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Smartwatch, Charging USB Dock, User Manual"),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Sales Package:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Smartwatch, Charging USB Dock, User Manual"),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Sales Package:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Smartwatch, Charging USB Dock, User Manual"),
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Sales Package:"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text("Smartwatch, Charging USB Dock, User Manual"),
                    ),
                  ])
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
