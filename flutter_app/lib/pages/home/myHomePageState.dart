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
          padding: EdgeInsets.all(30.00),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20.00),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      '< 16.0:',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 85, 255, 1.00),
                      ),
                    ),
                    Text(
                      '16.00–16.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 183, 255, 1.00),
                      ),
                    ),
                    Text(
                      '17.00–18.49:',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 224, 198, 1.00),
                      ),
                    ),
                    Text(
                      '18.50–24.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(0, 191, 6, 1.00),
                      ),
                    ),
                    Text(
                      '25.00–29.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 213, 0, 1.00),
                      ),
                    ),
                    Text(
                      '30.00–34.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 174, 0, 1.00),
                      ),
                    ),
                    Text(
                      '35.00–39.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 132, 0, 1.00),
                      ),
                    ),
                    Text(
                      '40.00-44.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 106, 0, 1.0),
                      ),
                    ),
                    Text(
                      '45.00-49.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 77, 0, 1.0),
                      ),
                    ),
                    Text(
                      '50.00-59.99:',
                      style: TextStyle(
                        color: Color.fromRGBO(255, 10, 0, 1.0),
                      ),
                    ),
                    Text(
                      '≥ 60.00:',
                      style: TextStyle(
                        color: Color.fromRGBO(150, 52, 23, 1.0),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Very severely underweight',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 85, 255, 1.00),
                    ),
                  ),
                  Text(
                    'Severely underweight',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 183, 255, 1.00),
                    ),
                  ),
                  Text(
                    'Underweight',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 224, 198, 1.00),
                    ),
                  ),
                  Text(
                    'Normal',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 191, 6, 1.00),
                    ),
                  ),
                  Text(
                    'Overweight',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 213, 0, 1.00),
                    ),
                  ),
                  Text(
                    'Obese Class I (Moderately obese)',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 174, 0, 1.00),
                    ),
                  ),
                  Text(
                    'Obese Class II (Severely obese)',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 132, 0, 1.00),
                    ),
                  ),
                  Text(
                    'Obese Class III (Very severely obese)',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 106, 0, 1.0),
                    ),
                  ),
                  Text(
                    'Obese Class IV (Morbidly Obese)',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 77, 0, 1.0),
                    ),
                  ),
                  Text(
                    'Obese Class V (Super Obese)',
                    style: TextStyle(
                      color: Color.fromRGBO(255, 10, 0, 1.0),
                    ),
                  ),
                  Text(
                    'Obese Class VI (Hyper Obese)',
                    style: TextStyle(
                      color: Color.fromRGBO(150, 52, 23, 1.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}
