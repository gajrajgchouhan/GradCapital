// import 'dart:html';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpendingsPage extends StatefulWidget {
  const SpendingsPage({super.key});

  @override
  State<SpendingsPage> createState() => _SpendingsPageState();
}

class _SpendingsPageState extends State<SpendingsPage>
    with TickerProviderStateMixin {
  late PageController _pageController;
  late TabController _tabController;
  String _title = "Spendings";
  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: 1,
    );
    _tabController = TabController(initialIndex: 1, length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   title: Text(_title,
        //       style: GoogleFonts.montserrat(
        //         color: const Color.fromRGBO(54, 54, 54, 1),
        //         fontSize: 16,
        //       )),
        // ),
        body: Column(
      children: <Widget>[
        SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(children: [
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromRGBO(54, 54, 54, 1),
                        size: 22.0,
                      )),
                  const SizedBox(width: 10),
                  Text(_title,
                      style: GoogleFonts.montserrat(
                        color: const Color.fromRGBO(54, 54, 54, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ))
                ]))),
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromRGBO(92, 244, 217, 0.5),
                Color.fromRGBO(66, 136, 233, 0)
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding: const EdgeInsets.only(top: 25.0, left: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(bottom: 5),
                              child: Text("debit",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromRGBO(86, 85, 85, 1),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: Text("9,700",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromRGBO(54, 54, 54, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("balance",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromRGBO(54, 54, 54, 1),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(
                                bottom: 20.0,
                              ),
                              child: Text("7,200",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromRGBO(244, 92, 92, 1),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Text("credit",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromRGBO(86, 85, 85, 1),
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: Text("42,500",
                                  style: GoogleFonts.montserrat(
                                    color: const Color.fromRGBO(54, 54, 54, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ))),
                        ])),
                Padding(
                    padding: const EdgeInsets.only(top: 25.0, right: 30),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.network(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgIWwryUUArHF_DWOh2Xxkg_X96SC-BbMiWp1DrNTYgpBH7AJ3G8q_w_XjKdAJSLh4pW0&usqp=CAU",
                              height: 50.0,
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Text("Fresher's Party 22",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text("B Tech 2021",
                                  style: GoogleFonts.montserrat(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))),
                          Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(children: [
                                Container(
                                    padding: const EdgeInsets.only(
                                        top: 3, bottom: 3, left: 17, right: 17),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              113, 113, 113, 1),
                                          width: 1,
                                        )),
                                    child: Text(
                                      "Check\n Messages",
                                      style:
                                          GoogleFonts.montserrat(fontSize: 10),
                                      textAlign: TextAlign.center,
                                    )),
                                const SizedBox(width: 10),
                                Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: const Color.fromRGBO(
                                              113, 113, 113, 1),
                                          width: 1,
                                        )),
                                    child: const Icon(
                                      Icons.create_outlined,
                                      color: Color.fromRGBO(113, 113, 113, 1),
                                      size: 22.0,
                                    ))
                              ]))
                        ]))
              ],
            )),
        Container(
          color: Colors.white,
          child: TabBar(
            onTap: (val) {
              setState(() {
                if (val == 0) {
                  _title = "Announcements";
                }
                if (val == 1) {
                  _title = "Spendings";
                }
                if (val == 2) {
                  _title = "Credits";
                }
              });
              _pageController.animateToPage(val,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.elasticInOut);
            },
            unselectedLabelColor: Colors.grey.shade700,
            indicatorColor: const Color.fromRGBO(244, 92, 92, 1),
            indicatorWeight: 2.0,
            labelColor: Colors.black,
            controller: _tabController,
            tabs: const [
              Tab(
                child: Icon(
                  Icons.circle_notifications_outlined,
                  size: 30,
                ),
              ),
              Tab(
                child: Icon(Icons.receipt_long),
              ),
              Tab(
                child: Icon(Icons.monetization_on_outlined),
              ),
            ],
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        Expanded(
          child: PageView(
            scrollDirection: Axis.vertical,
            allowImplicitScrolling: false,
            pageSnapping: false,
            physics: const RangeMaintainingScrollPhysics(),
            controller: _pageController,
            // key: sliverListtKey,
            children: [
              Container(
                  color: Colors.white,
                  height: 100,
                  child: Text(
                    "Announcements",
                    style: GoogleFonts.montserrat(
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  )),
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                elevation: 8,
                color: const Color.fromRGBO(240, 240, 240, 1),
                // child: Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, )
                            },
                            child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: SizedBox(
                                    height: 80,
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          child: Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGL98ush_JVAtrRt7HMg-uf0tD51kRZBYG0A&usqp=CAU",
                                            height: 50.0,
                                          ),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, top: 20),
                                                child: Text("Soft Drinks",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              54, 54, 54, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                    ),
                                                    textAlign: TextAlign.left),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text("Monal Canteen",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              54, 54, 54, 1),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.left),
                                              ),
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text("Rs. 30000",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              113, 113, 113, 1),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )),
                                                Text("27 Jan",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              113, 113, 113, 1),
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ))
                                              ]),
                                        )
                                      ],
                                    ))),
                          ),
                        ])),
              ),
              Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                elevation: 8,
                color: const Color.fromRGBO(240, 240, 240, 1),
                // child: Expanded(
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              // Navigator.push(context, )
                            },
                            child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: SizedBox(
                                    height: 80,
                                    width: MediaQuery.of(context).size.width *
                                        0.95,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7.0),
                                          child: Image.network(
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGL98ush_JVAtrRt7HMg-uf0tD51kRZBYG0A&usqp=CAU",
                                            height: 50.0,
                                          ),
                                        ),
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15, top: 20),
                                                child: Text("Collection B8",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              54, 54, 54, 1),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                    ),
                                                    textAlign: TextAlign.left),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Text("Ram Thakur",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              54, 54, 54, 1),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 14,
                                                    ),
                                                    textAlign: TextAlign.left),
                                              ),
                                            ]),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Text("Rs. 30000",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              138, 207, 84, 1),
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )),
                                                Text("27 Jan",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      color:
                                                          const Color.fromRGBO(
                                                              113, 113, 113, 1),
                                                      fontSize: 12,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                    ))
                                              ]),
                                        )
                                      ],
                                    ))),
                          ),
                        ])),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
