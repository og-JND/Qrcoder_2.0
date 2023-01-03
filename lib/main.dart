import 'dart:async';
import 'package:qrcoder_two/qr_gen.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:qrcoder_two/font_business.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  runApp( MaterialApp(
      // initialRoute: '/',
      // routes: {
      // '/' : (context) => HomePage(),
      // '/generator' : (context) => QrGenBoi()
      // },
      debugShowCheckedModeBanner: false,
      home:HomePage()));
  }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String makeMeIntoAQRCode ='';
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
        backgroundColor: Colors.cyan[100],
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: const Color(0xFF262626),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
            Text("QrCoder"),
            Icon(Icons.qr_code)
          ],),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 1,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(13,10,5,9),
                    child: Column(
                      children: const [
                        Text(
                          'Tip: if you scan a link, copy and paste it into your browser *wink*',
                          style: TextStyle(
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                )
            ),
            Expanded(
                flex: 4,
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    Opacity(opacity: 0.3, child: Image.asset(
                      'lib/img/frame.png',
                      height: 146,
                      width: 146,
                    ),
                  ),

                    Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
                    child: NormalFont('Results: $_scanBarcode',),
                  ),

                  IconButton(

                      onPressed: () {Clipboard.setData(ClipboardData(text: _scanBarcode)).then((_){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                        "Text copied to clipboard",
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'Nue'
                      ),
                    )));

                  });}, icon: Icon(Icons.copy)),

                ],
                ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                          // side: BorderSide(color: Colors.black)
                        )
                        ),
                        backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                        foregroundColor: MaterialStateProperty.all(Colors.black87),
                      ),
                      onPressed: () => startScanning(),
                      child: Text(
                        'Start scanning',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Nue'
                        ),
                      ),
                    ),
              ],

                ),
            ),
            const Divider(
              thickness: 1,
              endIndent: 20.2,
              indent: 20.2,
              color: Color(0xFF262626),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black87,
                      width: 2,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.black87,
                      width: 2,
                    ),
                  // icon: Icon(Icons.qr_code),
                  //OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(10),
                  //   borderSide: const BorderSide(
                  //
                  //     width: 3,
                  //     color: Colors.black,
                  //   ),
                  // ),
                ),
                hintText: 'Input data',
                ),
                onChanged: (text){
                  makeMeIntoAQRCode = text;
                },
              ),
            ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,0,0,16),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                  // side: BorderSide(color: Colors.black)
                                )
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
                                foregroundColor: MaterialStateProperty.all(Colors.black87),
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute( builder: (context) => QrGenBoi(datastuff: makeMeIntoAQRCode)));
                              },
                              child: Text(
                                  'Make your own Qr Code',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Nue',
                                    color: Colors.black
                                  ),)
                          ),
                        ),
          ],
        ),
      ),
    );
  }
}
