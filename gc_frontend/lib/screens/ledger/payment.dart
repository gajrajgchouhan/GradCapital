import 'package:flutter/material.dart';
import 'package:gc_frontend/screens/ledger/scanQR.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

import 'package:gc_frontend/screens/ledger/payment/manual.dart';

class Payment extends StatelessWidget {
  const Payment({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 1.0,
        builder: (context, controller) {
          return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(238, 238, 238, 1),
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              child: ListView(controller: controller, children: [
                Transform.rotate(
                  angle: -pi / 2,
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(17),
                    child: Text("Select Payment\n Method",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.montserrat(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromRGBO(244, 106, 92, 1)))),
                GridView(
                    padding: const EdgeInsets.all(15),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                    ),
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ManualEntry(
                                      debitAmt: 100, mode: "Cash")),
                            );
                          },
                          child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              elevation: 8,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    113, 113, 113, 1),
                                                width: 2,
                                              )),
                                          child: const Icon(
                                            Icons.edit_document,
                                            color: Color.fromRGBO(
                                                113, 113, 113, 1),
                                            size: 35.0,
                                            weight: 10,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text("Manual\n Entry",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromRGBO(
                                                      179, 179, 179, 1))))
                                    ]),
                              ))),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ScanQRPage()));
                          },
                          child: Card(
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              elevation: 8,
                              child: Container(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    113, 113, 113, 1),
                                                width: 2,
                                              )),
                                          child: const Icon(
                                            Icons.qr_code_2,
                                            color: Color.fromRGBO(
                                                113, 113, 113, 1),
                                            size: 35.0,
                                            weight: 10,
                                          )),
                                      Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text("MOI QR\n Scanner",
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: const Color.fromRGBO(
                                                      179, 179, 179, 1)))),
                                    ]),
                              ))),
                      Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          elevation: 8,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: const Color.fromRGBO(
                                                113, 113, 113, 1),
                                            width: 2,
                                          )),
                                      child: const Icon(
                                        Icons.credit_score_rounded,
                                        color: Color.fromRGBO(113, 113, 113, 1),
                                        size: 35.0,
                                        weight: 10,
                                      )),
                                  Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Text("Other",
                                          style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: const Color.fromRGBO(
                                                  179, 179, 179, 1))))
                                ]),
                          )),
                      Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          elevation: 8,
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Color.fromRGBO(113, 113, 113, 1),
                                  size: 70.0,
                                  weight: 10,
                                )),
                          )),
                    ])
              ]));
        });
  }
}
