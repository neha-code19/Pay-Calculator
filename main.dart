import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pay Calculator',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Pay Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController hours = TextEditingController();
  TextEditingController hourly_rate = TextEditingController();
  double regular_pay = 0.00;
  double overTime_pay = 0.00;
  double total_pay = 0.00;
  double tax = 0.00;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Column(
          children: [
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 30, 50, 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: hours,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Number of Hours',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: hourly_rate,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Hourly Rate',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(140, 0, 20, 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.blue),
                      child: const Text('calculate'),
                      onPressed: () {
                        setState(() {
                          var total_hours = hours.text;
                          var hourly_pay = hourly_rate.text;

                          if (double.parse(total_hours) <= 40) {
                            regular_pay = double.parse(total_hours) *
                                double.parse(hourly_pay);
                            total_pay = regular_pay;
                            tax = regular_pay * 0.18;
                          } else {
                            overTime_pay = (double.parse(total_hours) - 40) *
                                double.parse(hourly_pay) *
                                1.5;
                            total_pay =
                                overTime_pay + 40 * double.parse(hourly_pay);

                            tax = total_pay * 0.18;
                          }
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(50, 0, 30, 20),
                    child: Text(
                        'Report \n\nRegular Pay:$regular_pay \nOvertime pay:$overTime_pay  \nTotal pay:$total_pay  \nTax:$tax'),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Flexible(
                  child: Container(
                      padding: const EdgeInsets.fromLTRB(130, 10, 50, 20),
                      child: const Text('Neha Patel \n 301280513',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
