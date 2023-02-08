import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            // color: Color.fromRGBO(238, 238, 238, 1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Your Account",
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(54, 54, 54, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      )))),
          const SizedBox(height: 20),
          InkWell(
              onTap: () {},
              child: Card(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .05,
                    right: MediaQuery.of(context).size.width * .05,
                    top: 15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                elevation: 8,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          // height: MediaQuery.of(context).size.height * .6,
                          width: MediaQuery.of(context).size.height * .8,
                          decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(30.0),
                              gradient: const LinearGradient(
                            colors: [
                              Color.fromRGBO(140, 64, 240, 1),
                              Color.fromRGBO(66, 13, 135, 1),
                            ],
                          )),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: const EdgeInsets.only(top: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.0),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    const SizedBox(width: 15),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25.0),
                                      child: Image.network(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgIWwryUUArHF_DWOh2Xxkg_X96SC-BbMiWp1DrNTYgpBH7AJ3G8q_w_XjKdAJSLh4pW0&usqp=CAU",
                                        height: 50.0,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, top: 10),
                                              child: Text("Grad Capital",
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16,
                                                  ),
                                                  textAlign: TextAlign.left),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text("BITS-IIMA",
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Text("Hii,\n I am Grad Capital!",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))),
                            ],
                          ))
                    ]),
              )),
        ]));
  }
}
