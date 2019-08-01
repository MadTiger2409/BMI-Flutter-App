import 'package:flutter/material.dart';

class HeightInput extends StatelessWidget {
  final TextEditingController heightController;

  HeightInput({Key key, this.heightController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            borderSide: BorderSide(color: Colors.green, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen, width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
