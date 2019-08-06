import 'package:flutter/material.dart';
import 'package:flutter_app/models/result.dart';
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
      _bmi = BmiCalculator.calculate(
          Parser.parseInvariant(heightController.text),
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
  void dispose() {
    weightController.dispose();
    heightController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ExactAssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.all(50.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 50.00, top: 20.00),
                  child: Text(
                    'Your BMI is: ${_bmi.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 30.00,
                    ),
                  ),
                ),
                WeightInput(weightController: weightController),
                HeightInput(heightController: heightController),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    color: Colors.lightGreen,
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
            onPressed: () {
              _settingModalBottomSheet(context);
            },
            tooltip: 'Info',
            child: Icon(Icons.info_outline),
          ),
        ),
      ],
    );
  }

  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            padding: EdgeInsets.all(30.00),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Table(
                    columnWidths: {
                      1: FlexColumnWidth(2),
                    },
                    children: _createResultsRows(_createResultsList()),
                  ),
                )
              ],
            ),
          );
        });
  }

  List<TableRow> _createResultsRows(List<Result> results) {
    List<TableRow> resultRows = List<TableRow>();

    resultRows.add(
      TableRow(
        children: <Widget>[
          TableCell(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Result',
                style: TextStyle(
                  fontSize: 22.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TableCell(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 22.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );

    results.forEach(
      (f) => resultRows.add(
        TableRow(
          children: <Widget>[
            TableCell(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  f.bmiLevel,
                  style: TextStyle(
                    color: f.levelTextColor,
                  ),
                ),
              ),
            ),
            TableCell(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  f.bmiLevelDescription,
                  style: TextStyle(
                    color: f.levelTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );

    return resultRows;
  }

  List<Result> _createResultsList() {
    List<Result> results = List<Result>();

    results.add(Result('< 16.0:', 'Very severely underweight',
        Color.fromRGBO(0, 85, 255, 1.00)));
    results.add(Result('16.00–16.99:', 'Severely underweight',
        Color.fromRGBO(0, 183, 255, 1.00)));
    results.add(Result(
        '17.00–18.49:', 'Underweight', Color.fromRGBO(0, 224, 198, 1.00)));
    results
        .add(Result('18.50–24.99:', 'Normal', Color.fromRGBO(0, 191, 6, 1.00)));
    results.add(Result(
        '25.00–29.99:', 'Overweight', Color.fromRGBO(255, 213, 0, 1.00)));
    results.add(Result('30.00–34.99:', 'Obese Class I (Moderately obese)',
        Color.fromRGBO(255, 174, 0, 1.00)));
    results.add(Result('35.00–39.99:', 'Obese Class II (Severely obese)',
        Color.fromRGBO(255, 132, 0, 1.00)));
    results.add(Result('40.00-44.99:', 'Obese Class III (Very severely obese)',
        Color.fromRGBO(255, 106, 0, 1.0)));
    results.add(Result('45.00-49.99:', 'Obese Class IV (Morbidly Obese)',
        Color.fromRGBO(0, 85, 255, 1.00)));
    results.add(Result('50.00-59.99:', 'Obese Class V (Super Obese)',
        Color.fromRGBO(255, 10, 0, 1.0)));
    results.add(Result('≥ 60.00:', 'Obese Class VI (Hyper Obese)',
        Color.fromRGBO(150, 52, 23, 1.0)));

    return results;
  }
}
