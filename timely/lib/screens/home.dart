import 'package:flutter/material.dart';
import 'package:timely/screens/orders.dart';
import 'package:timely/screens/product_list.dart';
import 'package:timely/screens/view_product.dart';
import 'package:timely/utils/constants.dart';

import 'cart.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  void viewProduct() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ViewProduct()));
  }

  void viewListProduct(title) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ProductList(title)));
  }

  void viewCart() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  }

  void viewOrders() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Orders()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Colors.yellow,
              brightness: Brightness.light,
              expandedHeight: 200.0,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(bottom: 30.0, left: 16.0),
                collapseMode: CollapseMode.parallax,
                title: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Watchs'),
                    Text(
                      'That fits your needs',
                      style: TextStyle(
                          fontSize: 12.0, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                background: Container(
                  color: Constants.backgroundColor,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(100.0))),
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Most popular",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 250.0,
                  child: ListView(
                    padding: EdgeInsets.only(left: 6.0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(6.0),
                        height: 200.0,
                        width: 200.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/watch/r3.jpg',
                                    width: 120.0,
                                    height: 120.0,
                                  ),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  Text(
                                    "Rolex TS1200",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "₹ 2,999",
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        height: 200.0,
                        width: 200.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/watch/f1.jpg',
                                    width: 120.0,
                                    height: 120.0,
                                  ),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  Text(
                                    "Fasttrack TS1200",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "₹ 2999",
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        height: 200.0,
                        width: 200.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/watch/f1.jpg',
                                    width: 120.0,
                                    height: 120.0,
                                  ),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  Text(
                                    "Fasttrack TS1200",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "₹ 2999",
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(6.0),
                        height: 200.0,
                        width: 200.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    'assets/watch/f1.jpg',
                                    width: 120.0,
                                    height: 120.0,
                                  ),
                                  Expanded(
                                    child: Text(''),
                                  ),
                                  Text(
                                    "Fasttrack TS1200",
                                    style: Theme.of(context).textTheme.caption,
                                  ),
                                  Text(
                                    "₹ 2999",
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Shop for",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 75.0,
                  child: ListView(
                    padding: EdgeInsets.only(left: 16.0),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => viewListProduct('Boss'),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          color: Colors.black,
                          height: 75.0,
                          width: 75.0,
                          child: Image.asset(
                            'assets/logos/boss.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                        onTap: () => viewListProduct('Boss'),
                        child: Container(
                          padding: EdgeInsets.all(12.0),
                          color: Colors.white,
                          height: 75.0,
                          width: 75.0,
                          child: Image.asset(
                            'assets/logos/rolex.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                        onTap: () => viewListProduct('Boss'),
                        child: Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(12.0),
                          height: 75.0,
                          width: 75.0,
                          child: Image.asset(
                            'assets/logos/fasttrack.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      GestureDetector(
                        onTap: () => viewListProduct('Boss'),
                        child: Container(
                          color: Colors.white,
                          height: 75.0,
                          width: 75.0,
                          child: Image.asset(
                            'assets/logos/titan.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24.0, bottom: 24.0),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Today's Deals",
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  height: 200.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(12.0),
                        height: 150.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Watchs starting from',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        '₹ 5000',
                                        style:
                                            Theme.of(context).textTheme.title,
                                      ),
                                      Expanded(
                                        child: Text(''),
                                      ),
                                      Text(
                                        'Ends in 13:56:45 hours',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/watch/f3.jpg')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        height: 150.0,
                        width: 350.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Watchs starting from',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        '₹ 5000',
                                        style:
                                            Theme.of(context).textTheme.title,
                                      ),
                                      Expanded(
                                        child: Text(''),
                                      ),
                                      Text(
                                        'Ends in 13:56:45 hours',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/watch/f2.jpg')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(12.0),
                        height: 150.0,
                        width: 350.0,
                        child: GestureDetector(
                          onTap: viewProduct,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50.0),
                                  topLeft: Radius.circular(12.0)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Watchs starting from',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle,
                                      ),
                                      SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        '₹ 5000',
                                        style:
                                            Theme.of(context).textTheme.title,
                                      ),
                                      Expanded(
                                        child: Text(''),
                                      ),
                                      Text(
                                        'Ends in 13:56:45 hours',
                                        style:
                                            Theme.of(context).textTheme.caption,
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/watch/f1.jpg')
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.yellow.shade100,
        selectedItemColor: Colors.yellow.shade100,
        onTap: (index) {
          if (index == 0) {
            viewListProduct('Favorite');
          } else if (index == 1) {
            viewCart();
          } else {
            viewOrders();
          }
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), title: Text('Cart')),
          BottomNavigationBarItem(
              icon: Icon(Icons.receipt), title: Text('My Orders')),
        ],
      ),
    );
  }
}
