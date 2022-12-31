import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// This class creates a default font style for the app.

class NormalFont extends StatelessWidget {
  String outputText;
  NormalFont(this.outputText);
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style:
      const TextStyle(fontSize: 18,
          fontFamily: 'Nue',
          wordSpacing: 1,
          color: Colors.black),
      child: Text(outputText),
    );
  }
}
