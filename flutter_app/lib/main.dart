import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fit App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'BMI Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();

  num _weight = 0.0;
  num _height = 0.0;
  num _bmi = 0.0;

  void calculateBmi() {
    setState(() {
      _weight = num.parse(weightController.text);
      _height = num.parse(heightController.text);

      _bmi = _weight / (pow(_height, 2));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: weightController,
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(labelText: 'Weight in kilograms'),
              autocorrect: false,
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: heightController,
              style: TextStyle(
                fontSize: 20.0,
              ),
              decoration: InputDecoration(labelText: 'Height in metters'),
              keyboardType: TextInputType.number,
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                child: Text('Calculate'),
                onPressed: calculateBmi,
              ),
            ),
            Text('Your BMI is: ${_bmi.toStringAsFixed(2)}')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Settings',
        child: Icon(Icons.settings),
      ),
    );
  }
}
