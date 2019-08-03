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
            onPressed: (){
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('< 16.0 – wygłodzenie'),
              Text('16.0–16.99 – wychudzenie'),
              Text('17.0–18.49 – niedowaga'),
              Text('18.5–24.99 – wartość prawidłowa'),
              Text('25.0–29.99 – nadwaga'),
              Text('30.0–34.99 – I stopień otyłości'),
              Text('35.0–39.99 – II stopień otyłości (otyłość kliniczna)'),
              Text('≥ 40.0 – III stopień otyłości (otyłość skrajna)'),
            ],
          ),
        );
      }
    );
  }
}
