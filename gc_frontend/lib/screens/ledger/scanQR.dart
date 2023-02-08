import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gc_frontend/screens/ledger/payment/manual.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.blue,
      width:MediaQuery.of(context).size.width,
      height:MediaQuery.of(context).size.width,
       padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * .05,
          right: MediaQuery.of(context).size.width * .05,
          top:  MediaQuery.of(context).size.width * .2,
          bottom: MediaQuery.of(context).size.width * .2),
    child:Card(
     
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      elevation: 8,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width * .4),
          Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text("Enter the Amount\n you want to Pay",
                  style: GoogleFonts.montserrat(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ))),
          const SizedBox(height: 30),
          Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Amount',
                      labelStyle: TextStyle(
                        color: Color.fromRGBO(179, 177, 177, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                      )),
                  onChanged: (value) => setState(() {
                        amount = double.parse(value);
                      }))),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                String codeSanner = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR);
                print(codeSanner);
                if (amount == 0) {
                  throw Exception('Invalid Amount');
                }
                if (!await launchUrlString("$codeSanner&am=$amount")) {
                  throw Exception('Invalid UPI');
                }
                 Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ManualEntry()),
                            );
                // else{
                //    // ignore: use_build_context_synchronously
                //    Navigator.push(
                //               context,
                //               MaterialPageRoute(
                //                   builder: (context) => const ManualEntry()),
                //             );
                // }
              },
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll<Color>(
                    Colors.blue,
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ))),
              child: Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.24,
                  child: Text(
                    "Open Scanner",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  )),
            ),
          )
        ],
      ),
    ));
  }
}
