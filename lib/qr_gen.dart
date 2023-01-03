import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'font_business.dart';

class QrGenBoi extends StatelessWidget {
  QrGenBoi({Key? key, required this.datastuff}) : super(key: key);
  String datastuff;

  @override
  Widget build(BuildContext context) {
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child:
              Padding(padding: EdgeInsets.all(5),
                //Image.asset()
                child: QrImage(
                  version: QrVersions.auto,
                  semanticsLabel: 'Its a qr code, neat innit?',
                  embeddedImage: const AssetImage('lib/img/frame.png'),
                  gapless: true,
                  // Just to add that little image inside the Qr code
                  //
                  //embeddedImageStyle: QrEmbeddedImageStyle(
                  //  size: Size(40,40)
                  //),
                  data: datastuff,
                ),
              )
            ),
            const Divider(
              thickness: 1,
              endIndent: 20.2,
              indent: 20.2,
              color: Color(0xFF262626),
            ),

            const Expanded(
                flex: 1,
                child:
               Padding(
                 padding: EdgeInsets.fromLTRB(13,10,0,13),
                 child: Text(
                  'Your Qr Code is ready, scan it somewhere or screenshot it to save for later.',
              style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Nue',
                    height: 1,
              ),
             ),
               ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,30),
              child: Container(
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
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Main Menu',
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Nue'
                  ),
                ),
              ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
