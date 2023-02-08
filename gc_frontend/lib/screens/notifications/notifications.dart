import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(238, 238, 238, 1),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        child: SingleChildScrollView(
            child: Column(children: [
             const SizedBox(height:20),
          Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Notifications",
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(54, 54, 54, 1),
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      )))),
          // const SizedBox(height: 10),
          InkWell(
              onTap: () {
              },
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
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25)),
                          child: Image.network(
                              "https://s3-alpha-sig.figma.com/img/9f8c/36c2/03d37021fa0adf25cfd955d18c8d97a7?Expires=1676851200&Signature=IBspb5mW-Khb0VYJ~-~Rr0fiFC1yw~HTzIuezBKlVGpv-L6RJVy3bEJ7k8jv1eG0CuiTP4~ELJD5W4jfjdUMYgTBz-RP9aPDWJONHqUS-fDtAVyhcseiV5HE4d5sKbqmRlxMp06W5lcfbpZD46kYO4YSoVNhEbOYMK879qd1G6~wzRwQXJJbKiBp1z3GRDdO~A0tFYcCuNBVoHjEQcRllbH85074mw-MpE6Dhu8bvx~GcUXK73-cgRxKEj9WikZsJVlVa-qSbmWXDloeE51P0X7rNL-at~jzVO~K2IH-BWa6ONKYotqA8MOnaDdo7mHzYqVYrR7LV58noxqGo6I~VQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
                              // height: 200.0,
                              width: MediaQuery.of(context).size.width * .9)),
                      Container(
                          // height: MediaQuery.of(context).size.height * .6,
                          width: MediaQuery.of(context).size.height * .8,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(140, 64, 240, 1),
                              Color.fromRGBO(66, 13, 135, 1),
                            ],
                          )),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, bottom: 20),
                                  child: Text(
                                    "Group Joining Invite",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                              Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width * 0.7,
                                margin: const EdgeInsets.only(top: 10),
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
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15, top: 10),
                                              child: Text("Fresher's Party 22",
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
                                              child: Text("BTech 2021",
                                                  style: GoogleFonts.montserrat(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 14,
                                                  ),
                                                  textAlign: TextAlign.left),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                  "Created By Abhi Rathore",
                                                  style: GoogleFonts.montserrat(
                                                    color: const Color.fromARGB(
                                                        255, 103, 101, 101),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 12,
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
                                  child: Text(
                                      "Greetings,\n We kindly request you to contribute for the conduction of Freshers’ Party of the upcoming Batch.\n Let’s make this one awesome together!",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500))),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text("AMOUNT TO BE PAID",
                                      style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600))),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Rs 500",
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center,
                                  )),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll<
                                                  Color>(Colors.white),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(28.5),
                                          ))),
                                      child: Container(
                                          padding: const EdgeInsets.all(12),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *0.23,
                                          child: Text(
                                            'Accept & Pay',
                                            style: GoogleFonts.montserrat(
                                                color: const Color.fromRGBO(
                                                    112, 84, 255, 1),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ButtonStyle(
                                          backgroundColor:
                                              const MaterialStatePropertyAll<
                                                  Color>(
                                            Color.fromRGBO(
                                                          80, 20, 177, 1),
                                          ),
                                          shape: MaterialStateProperty.all<
                                                  RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                  side: const BorderSide(
                                                      color: Colors.white,
                                                      width: 2)))),
                                      child: Container(
                                          padding: const EdgeInsets.all(12),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.24,
                                          child: Text(
                                            'Reject',
                                            style: GoogleFonts.montserrat(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ))
                    ]),
              )),
        ])));
  }
}
