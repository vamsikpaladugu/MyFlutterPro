import 'package:flutter/material.dart';
import 'package:timely/screens/view_product.dart';

class ProductList extends StatelessWidget {
  final String title;

  ProductList(this.title);

  @override
  Widget build(BuildContext context) {
    void viewProduct() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ViewProduct()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.75),
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
                        'assets/watch/r2.jpg',
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
                        'assets/watch/r1.jpg',
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
                        'assets/watch/f2.jpg',
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
                        'assets/watch/f3.jpg',
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
                        'assets/watch/t1.jpg',
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
                        'assets/watch/t3.jpg',
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
                        'assets/watch/t4.jpg',
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
                        'assets/watch/t5.jpg',
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
        ],
      ),
    );
  }
}
