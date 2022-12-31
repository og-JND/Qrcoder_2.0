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
          const TextStyle(fontSize: 30, fontFamily: 'Nue', color: Colors.black),
      child: Text(outputText),
    );
  }
}