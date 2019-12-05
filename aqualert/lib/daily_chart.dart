import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomRoundedBars extends StatelessWidget {
  Future getDataForChart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var formatterKey = DateFormat('ddMMyyyy');
    var formatterDay = DateFormat('EEE');

    var formatterDat = DateFormat('EEEE dd MMM, yyyy');

    final data = <OrdinalSales>[];

    DateTime dTime = DateTime.now();

    for (int i = 1; i < 8; i++) {
      DateTime dt = dTime.subtract(Duration(days: i));

      String key = formatterKey.format(dt);

      int counter = prefs.getInt('$key') ?? 0;

      data.add(OrdinalSales(
          formatterDay.format(dt), formatterDat.format(dt), counter * 250));
    }

    return data;

//    print('Pressed $counter times.');
//    await prefs.setInt('counter', counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Charts'),
      ),
      body: FutureBuilder(
        future: getDataForChart(),
        builder: (context, snapshot) {
          print("hi");
          print(snapshot.data[0].qty);

          return Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12.0),
                height: 200.0,
                child: charts.BarChart(
                  [
                    new charts.Series<OrdinalSales, String>(
                      id: 'Sales',
                      colorFn: (_, __) =>
                          charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (OrdinalSales sale, _) => sale.day,
                      measureFn: (OrdinalSales sale, _) => sale.qty,
                      data: snapshot.data,
                    )
                  ],
                  animate: true,
                  defaultRenderer: charts.BarRendererConfig(
                    cornerStrategy: charts.ConstCornerStrategy(30),
                  ),
                  domainAxis: charts.OrdinalAxisSpec(
                    renderSpec: charts.SmallTickRendererSpec(
                      // Tick and Label styling here.
                      labelStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.white),
                    ),
                  ),
                  primaryMeasureAxis: charts.NumericAxisSpec(
                    renderSpec: charts.GridlineRendererSpec(
                      // Tick and Label styling here.
                      labelStyle: charts.TextStyleSpec(
                          color: charts.MaterialPalette.white),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      OrdinalSales os = snapshot.data[index];

                      print(os.qty);

                      return ListTile(
                        title: Text(os.dat),
                        subtitle: Text('${os.qty} Cups 250 ML each'),
                        trailing: Text('${os.qty} ML'),
                      );
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}

class OrdinalSales {
  final String day;
  final int qty;
  final String dat;

  OrdinalSales(this.day, this.dat, this.qty);

  @override
  String toString() {
    return '$dat';
  }
}
