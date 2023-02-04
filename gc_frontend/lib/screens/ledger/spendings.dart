// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class SpendingsPage extends StatefulWidget {
  SpendingsPage({super.key});

  @override
  State<SpendingsPage> createState() => _SpendingsPageState();
}

class _SpendingsPageState extends State<SpendingsPage>
    with TickerProviderStateMixin {
  @override
  late PageController _pageController;
  late TabController _tabController;
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("Spendings",
              style: GoogleFonts.montserrat(
                color: const Color.fromRGBO(54, 54, 54, 1),
                fontSize: 16,
              )),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.black,
              child: TabBar(
                onTap: (val) {
                  _pageController.animateToPage(val,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.elasticInOut);
                },
                unselectedLabelColor: Colors.grey.shade700,
                indicatorColor: Colors.white,
                indicatorWeight: 2.0,
                labelColor: Colors.white,
                controller: _tabController,
                tabs: const [
                  Tab(
                    child: 
                      Icon(Icons.circle_notifications_rounded),
                    
                  ),
                  Tab(
                    child: Text(
                      "Blue",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Orange",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
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
                physics: RangeMaintainingScrollPhysics(),
                controller: _pageController,
                // key: sliverListtKey,
                children: [
                  Container(
                    color: Colors.white,
                    height: 100,
                    child:Text("Announcements",
                    style:GoogleFonts.montserrat(
                      fontSize: 15,
                    ))
                  ),
                  Container(
                    color: Colors.blue,
                    height: 700,
                  ),
                  Container(
                    color: Colors.orange,
                    height: 500,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
