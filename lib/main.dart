import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:qrcoder_two/font_business.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() => runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home:HomePage()));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _scanBarcode = 'Scan a code...';
  @override
  Widget build(BuildContext context) {

    //Created a function that brings up the scanning interface.
    Future<void> startScanning() async {
      String barcodeScanRes;
      // Platform messages may fail, so we use a try/catch PlatformException.
      try {
        barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#FF7F11', 'Cancel', true, ScanMode.QR);
        print(barcodeScanRes);
      } on PlatformException {
        barcodeScanRes = 'Failed to get platform version.';
      }
      setState(() {
        _scanBarcode = barcodeScanRes;
      });
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffabcbfa4),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF262626),
          title: Center(child: const Text('QrCoder')),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(9,10,0,0),
                    child: Column(
                      children: [
                        NormalFont('Tip: if you scan a link, copy and paste it into your browswer')
                      ],
                    )
                )
            ),
            Expanded(
                flex: 1,
                child:  Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,6),
                  child: NormalFont('Results: $_scanBarcode',),
                ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 20.2,
              indent: 20.2,
              color: Color(0xFF262626),
            ),
            Expanded(
                flex: 1,
                  child:
                    TextButton(
                        style: ButtonStyle(
                          //backgroundColor: MaterialStateProperty.all(const Color(0xFFacbfa4))
                        ),
                        onPressed: () => startScanning(),
                        child: NormalFont('Start scanning'),
                        )
                    ),
          ],
        ),
      ),
    );
  }
}
