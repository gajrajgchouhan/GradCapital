import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
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
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 100, 5, 0),
        child: Column(
          children: [
            TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter UPI ID',
                ),
                onChanged: (value) => setState(() {
                      amount = double.parse(value);
                    })),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () async {
                String codeSanner = await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666', 'Cancel', true, ScanMode.QR);
                print(codeSanner);
                if (amount == 0) {
                  throw Exception('Invalid Amount');
                }
                if (!await launchUrlString(codeSanner + "&amt=$amount")) {
                  throw Exception('Invalid UPI');
                }
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
