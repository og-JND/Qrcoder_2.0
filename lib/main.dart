import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:qrcoder_two/font_business.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //just initializing my ads yk...
  MobileAds.instance.initialize();

  runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 @override
  void initState() {
    super.initState();
  }
  String _scanBarcode = 'Scan a code...';
  @override
  Widget build(BuildContext context) {
    //creating an instance of the banner ad
    final BannerAd myBanner = BannerAd(
      adUnitId: '<ca-app-pub-3940256099942544/6300978111>',
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    );
    // loading the ad but not displaying it yet...
    myBanner.load();
    //this creates the ad widget for me to use

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
                  child: //NormalFont('Results: $_scanBarcode',),
                  AdWidget(ad: myBanner)
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
                        // style: const ButtonStyle(
                        //   backgroundColor: MaterialStateProperty.all(const Color(0xFFacbfa4))
                        // ),
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
