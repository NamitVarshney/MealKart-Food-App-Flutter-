import 'package:flutter/material.dart';

class MainColors {
  static const primaryColor = Color.fromRGBO(230, 230, 230, 1);
  static const secondaryColor = Colors.orangeAccent;
  static const whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const blackColor = Colors.black;
}

class CustomButton extends StatelessWidget {
  final Color color;
  final String text;
  final Color textColor;
  final Function function;
  CustomButton(
      {@required this.text,
      @required this.color,
      @required this.function,
      @required this.textColor});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      onPressed: function,
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      color: color,
    );
  }
}
