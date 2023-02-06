import 'dart:math';
import 'package:badges/badges.dart' as BadgesModule;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const details = ([
  {
    "first": "Uploader",
    "second": "Vatsal Hooda",
  },
  {
    "first": "Vendor",
    "second": "Monal Canteen",
  },
  {
    "first": "Amount",
    "second": "Rs. 5,500/-",
  },
  {
    "first": "Payment Method",
    "second": "Cash",
  },
]);

class Transcation extends StatelessWidget {
  const Transcation({
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Soft Drinks",
                      style: GoogleFonts.montserrat(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7.0),
                        child: Image.network(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGL98ush_JVAtrRt7HMg-uf0tD51kRZBYG0A&usqp=CAU",
                          height: 45.0,
                        ),
                      )),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Text(
                          "${details[index]["first"]!} :  ",
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(details[index]["second"]!,
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            ))
                      ],
                    )),
                separatorBuilder: (context, index) => const Divider(
                  color: Color.fromRGBO(131, 183, 255, 1),
                  height: 2,
                ),
                itemCount: details.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                "02 Feb 2023",
                style: GoogleFonts.montserrat(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(
                height: 15,
              ),
              GridView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 15.0,
                  mainAxisSpacing: 15.0,
                ),
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset("assets/images/bill.jpg",
                        // fit: BoxFit.cover,
                        height: 50),
                  ),
                  Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 8,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            113, 113, 113, 1),
                                        width: 2,
                                      )),
                                  child: const Icon(
                                    Icons.check,
                                    color: Color.fromRGBO(113, 113, 113, 1),
                                    size: 16,
                                  )),
                              Text("PROOF OF PAYMENT",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          179, 179, 179, 1)))
                            ]),
                      )),
                  Card(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      elevation: 8,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 5),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            113, 113, 113, 1),
                                        width: 2,
                                      )),
                                  child: const Icon(
                                    Icons.image,
                                    color: Color.fromRGBO(113, 113, 113, 1),
                                    size: 16,
                                  )),
                              Text("PICTURES",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: const Color.fromRGBO(
                                          179, 179, 179, 1)))
                            ]),
                      )),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 20, 4, 20),
                    child: Column(
                      children: [
                        BadgesModule.Badge(
                          position: BadgesModule.BadgePosition.topEnd(),
                          badgeContent: Text(
                            "7",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // backgroundColor: const Color.fromRGBO(255, 64, 64, 1),
                          child: const Icon(Icons.comment,
                              size: 30,
                              color: Color.fromRGBO(113, 113, 113, 1)),
                        ),
                        Text(
                          "COMMENTS",
                          style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(113, 113, 113, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 20, 2, 20),
                    child: Column(
                      children: [
                        BadgesModule.Badge(
                          position: BadgesModule.BadgePosition.topEnd(),
                          badgeContent: Text(
                            "12",
                            style: GoogleFonts.montserrat(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // backgroundColor: const Color.fromRGBO(255, 64, 64, 1),
                          child: const Icon(Icons.flag_outlined,
                              size: 30,
                              color: Color.fromRGBO(113, 113, 113, 1)),
                        ),
                        Text(
                          "RED FLAGS",
                          style: GoogleFonts.montserrat(
                            color: const Color.fromRGBO(113, 113, 113, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(2, 20, 4, 20),
                    child: Column(children: [
                      const Icon(Icons.circle_outlined,
                          size: 30, color: Color.fromRGBO(113, 113, 113, 1)),
                      const SizedBox(height: 5),
                      Text(
                        "AUTHENTICITY\n SCORE",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(113, 113, 113, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 15,
              // ),
              Container(
                padding: const EdgeInsets.all(10),
                // margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(213, 255, 255, 255),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Suspicious bill identified by AI",
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(244, 106, 92, 1),
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "LEARN MORE",
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(66, 136, 233, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      height: 10,
                      thickness: 2,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.flag_rounded,
                          color: Color.fromRGBO(244, 106, 92, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Flagged by ",
                              style: GoogleFonts.montserrat(
                                color: const Color.fromRGBO(113, 113, 113, 1),
                                fontStyle: FontStyle.italic,
                              ),
                              children: [
                                TextSpan(
                                    text: "Vatsal Hooda ",
                                    style: GoogleFonts.montserrat(
                                      color: const Color.fromRGBO(
                                          113, 113, 113, 1),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    )),
                                TextSpan(
                                    text: "and ",
                                    style: GoogleFonts.montserrat(
                                      color: const Color.fromRGBO(
                                          113, 113, 113, 1),
                                      fontStyle: FontStyle.italic,
                                    )),
                                TextSpan(
                                    text: "11 others.",
                                    style: GoogleFonts.montserrat(
                                      color: const Color.fromRGBO(
                                          113, 113, 113, 1),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ))
                              ]),
                        )
                      ],
                    )
                  ],
                ),
              )
            ]),
          );
        });
  }
}
