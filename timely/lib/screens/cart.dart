import 'package:flutter/material.dart';
import 'package:timely/screens/view_product.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void viewProduct() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ViewProduct()));
    }

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 50.0, left: 50.0),
        child: SizedBox(
          width: double.infinity,
          child: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(
              Icons.credit_card,
              color: Colors.white,
            ),
            label: Text(
              'Check out',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blue,
          ),
        ),
      ),
      appBar: AppBar(
        title: Text('Cart Total:'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: Center(
                child: Text(
              '₹ 17,999',
              style: Theme.of(context).textTheme.title,
            )),
          )
        ],
      ),
      body: ListView(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/watch/r1.jpg',
                        width: 120.0,
                        height: 120.0,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Rolex TS1200",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "₹ 2,999",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      )
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/watch/r2.jpg',
                        width: 120.0,
                        height: 120.0,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Rolex TS1200",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "₹ 2,999",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      )
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/watch/f3.jpg',
                        width: 120.0,
                        height: 120.0,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Rolex TS1200",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "₹ 2,999",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      )
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/watch/r3.jpg',
                        width: 120.0,
                        height: 120.0,
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Rolex TS1200",
                            style: Theme.of(context).textTheme.title,
                          ),
                          Text(
                            "₹ 2,999",
                            style: Theme.of(context).textTheme.subtitle,
                          ),
                        ],
                      )
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
