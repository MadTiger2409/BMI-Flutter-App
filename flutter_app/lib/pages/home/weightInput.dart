import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WeightInput extends StatelessWidget {
  final TextEditingController weightController;

  WeightInput({Key key, this.weightController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: weightController,
        style: TextStyle(
          fontSize: 18.0,
        ),
        decoration: InputDecoration(
          labelText: 'Weight in kilograms',
          hintText: 'e.g.: 80',
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        autocorrect: false,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
