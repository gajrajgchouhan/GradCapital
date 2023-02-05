import 'dart:math';

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
                  const Icon(
                    Icons.food_bank,
                    color: Colors.yellow,
                    size: 20,
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                itemBuilder: (context, index) => Row(
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
                ),
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
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      "assets/images/food.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.done,
                          color: Color.fromRGBO(179, 179, 179, 1),
                          size: 12,
                        ),
                        Text(
                          "PROOF OF PAYMENT",
                          style: GoogleFonts.montserrat(
                            color: Color.fromRGBO(179, 179, 179, 1),
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                  Badge(
                    alignment: AlignmentDirectional.topEnd,
                    label: Text(
                      "7",
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: Color.fromRGBO(255, 64, 64, 1),
                    child: Column(children: [
                      Icon(Icons.comment,
                          color: Color.fromRGBO(113, 113, 113, 1)),
                      SizedBox(height: 5),
                      Text(
                        "COMMENTS",
                        style: GoogleFonts.montserrat(
                          color: Color.fromRGBO(113, 113, 113, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ]),
                  ),
                  Container(),
                  Container(),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
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
                        color: Color.fromRGBO(244, 106, 92, 1),
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
                        color: Color.fromRGBO(66, 136, 233, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Divider(
                      color: Color.fromRGBO(217, 217, 217, 1),
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.flag_rounded,
                          color: Color.fromRGBO(244, 106, 92, 1),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "Flagged by",
                              style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(113, 113, 113, 1),
                                fontStyle: FontStyle.italic,
                              ),
                              children: [
                                TextSpan(
                                    text: "Vatsal Hooda",
                                    style: GoogleFonts.montserrat(
                                      color: Color.fromRGBO(113, 113, 113, 1),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    )),
                                TextSpan(
                                    text: "and",
                                    style: GoogleFonts.montserrat(
                                      color: Color.fromRGBO(113, 113, 113, 1),
                                      fontStyle: FontStyle.italic,
                                    )),
                                TextSpan(
                                    text: "11 others",
                                    style: GoogleFonts.montserrat(
                                      color: Color.fromRGBO(113, 113, 113, 1),
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
