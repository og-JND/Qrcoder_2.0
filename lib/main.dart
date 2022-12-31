import 'package:flutter/material.dart';
import 'package:qrcoder_two/font_business.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(const MaterialApp(home:HomePage()));

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffabcbfa4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF262626),
        title: const Text('QrCoder'),
      ),
      body: Column(
        children: [
          NormalFont('beans')
        ],
      ),
    );
  }
}
