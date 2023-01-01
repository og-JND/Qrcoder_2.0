import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: QrGen(),));

class QrGen extends StatefulWidget {
  const QrGen({Key? key}) : super(key: key);

  @override
  State<QrGen> createState() => _QrGenState();
}

class _QrGenState extends State<QrGen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generator screen'),
      ),
      body: Column(
        children: [
          Text('data'),
        ],
      ),
    );
  }
}
