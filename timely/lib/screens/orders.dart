import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 12.0, bottom: 12.0),
              child: Text(
                'Pending Orders',
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Order Id: #1112134009',
                    style: TextStyle(color: Colors.blue)),
                subtitle: Text('Plased on 24th Aug, 2019\nThree items'),
                isThreeLine: true,
                trailing: Text(
                  '₹ 2,900',
                  style: Theme.of(context).textTheme.title,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Order Id: #1112134009',
                    style: TextStyle(color: Colors.blue)),
                subtitle: Text('Plased on 24th Aug, 2019\nThree items'),
                isThreeLine: true,
                trailing: Text(
                  '₹ 2,900',
                  style: Theme.of(context).textTheme.title,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 24.0, top: 24.0, bottom: 12.0),
              child: Text(
                'Past Orders',
                style: Theme.of(context).textTheme.subhead,
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Order Id: #1112134009',
                    style: TextStyle(color: Colors.green)),
                subtitle: Text('Delivered on 24th Aug, 2019\nThree items'),
                isThreeLine: true,
                trailing: Text(
                  '₹ 2,900',
                  style: Theme.of(context).textTheme.title,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Order Id: #1112134009',
                    style: TextStyle(color: Colors.green)),
                subtitle: Text('Delivered on 24th Aug, 2019\nThree items'),
                isThreeLine: true,
                trailing: Text(
                  '₹ 2,900',
                  style: Theme.of(context).textTheme.title,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Order Id: #1112134009',
                    style: TextStyle(color: Colors.red)),
                subtitle: Text('Returned on 24th Aug, 2019\nThree items'),
                isThreeLine: true,
                trailing: Text(
                  '₹ 2,900',
                  style: Theme.of(context).textTheme.title,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Order Id: #1112134009',
                    style: TextStyle(color: Colors.green)),
                subtitle: Text('Delivered on 24th Aug, 2019\nThree items'),
                isThreeLine: true,
                trailing: Text(
                  '₹ 2,900',
                  style: Theme.of(context).textTheme.title,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.shopping_cart,
                    size: 16.0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
