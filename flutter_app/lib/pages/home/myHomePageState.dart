import 'package:flutter/material.dart';
import 'package:flutter_app/tools/bmiCalculator.dart';

import 'myHomePage.dart';

class MyHomePageState extends State<MyHomePage> {
  final weightController = TextEditingController();
  final heightController = TextEditingController();
  num _bmi = 0.0;

  void calculateBmi() {
    setState(() {
      _bmi = BmiCalculator.calculate(_parseInvariant(heightController.text),
          _parseInvariant(weightController.text));
    });
  }

  num _parseInvariant(String value) {
    if (value.contains(',')) {
      value = value.replaceAll(new RegExp(','), '.');
    }

    var parsedValue = num.tryParse(value);

    if (parsedValue == null) {
      return 0;
    }

    return parsedValue;
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
            Container(
              child: TextField(
                controller: weightController,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Weight in kilograms',
                  hintText: 'e.g.: 80',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                autocorrect: false,
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: heightController,
                style: TextStyle(
                  fontSize: 18.0,
                ),
                decoration: InputDecoration(
                  labelText: 'Height in metters',
                  hintText: 'e.g.: 1.68',
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.deepOrangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.orangeAccent, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                color: Colors.orange,
                child: Text(
                  'Calculate',
                ),
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
