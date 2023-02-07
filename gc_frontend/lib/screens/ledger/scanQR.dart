import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanQRPage extends StatefulWidget {
  const ScanQRPage({super.key});

  @override
  State<ScanQRPage> createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  String qrCodeResult = "Not yet scanned";

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 100, 5, 0),
        child: Column(
          children: [
            Text(qrCodeResult),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                String codeSanner = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR);
                print(codeSanner);
                setState(() {
                  qrCodeResult = codeSanner;
                });
              },
              child: Text(
                "Open Scanner",
                style: GoogleFonts.montserrat(),
              ),
              //Button having rounded rectangle border
            ),
          ],
        ),
      ),
    );
  }
}
