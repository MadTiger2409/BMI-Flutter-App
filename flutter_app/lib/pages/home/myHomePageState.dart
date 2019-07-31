import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home/heightInput.dart';
import 'package:flutter_app/pages/home/weightInput.dart';
import 'package:flutter_app/tools/bmiCalculator.dart';
import 'package:flutter_app/tools/parser.dart';

import 'myHomePage.dart';

class MyHomePageState extends State<MyHomePage> {
  TextEditingController heightController;
  TextEditingController weightController;
  num _bmi = 0.0;

  void calculateBmi() {
    setState(() {
      _bmi = BmiCalculator.calculate(Parser.parseInvariant(heightController.text),
          Parser.parseInvariant(weightController.text));
    });
  }

  @override
  void initState() {
    super.initState();

    weightController = TextEditingController();
    heightController = TextEditingController();
  }

  @override
  void dispose(){
    weightController.dispose();
    heightController.dispose();

    super.dispose();
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
            WeightInput(
              weightController: weightController
              ),
            HeightInput(
              heightController: heightController
              ),
            Container(
              margin: EdgeInsets.only(top: 20.00),
              child: Text(
                'Your BMI is: ${_bmi.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 30.00,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                color: Colors.orange,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 22.00,
                    ),
                ),
                onPressed: calculateBmi,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Info',
        child: Icon(Icons.info_outline),
      ),
    );
  }
}
