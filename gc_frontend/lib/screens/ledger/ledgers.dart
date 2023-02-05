import 'package:flutter/material.dart';
import 'package:gc_frontend/read_json.dart';
import 'package:gc_frontend/screens/ledger/spendings.dart';
import 'package:google_fonts/google_fonts.dart';

class LedgerPage extends StatefulWidget {
  const LedgerPage({super.key, required this.title});

  final String title;

  @override
  State<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends State<LedgerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // title: Text(widget.title,
      //     style: const TextStyle(
      //         color: Color.fromRGBO(50, 63, 75, 1),
      //         fontWeight: FontWeight.bold)),
      // ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(top: 20, bottom: 15, left: 20),
                    child: Text("MONDAY | 23 JAN",
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(54, 54, 54, 1),
                          // fontWeight: FontWeight.w800,
                          fontSize: 15,
                        ))),
                Row(
                  children: const [
                    Padding(
                        padding:
                            EdgeInsets.only(top: 20, bottom: 15, right: 15),
                        child: Icon(
                          Icons.toggle_on,
                          color: Color.fromRGBO(244, 92, 92, 1),
                          size: 50.0,
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(top: 20, bottom: 15, right: 40),
                        child: Icon(
                          Icons.add,
                          color: Color.fromRGBO(113, 113, 113, 1),
                          size: 35.0,
                        )),
                  ],
                ),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("Groups",
                        style: GoogleFonts.montserrat(
                          color: const Color.fromRGBO(54, 54, 54, 1),
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        )))),
            const SizedBox(height: 10),
            FutureBuilder(
              future: readJson('assets/data/ledgers.json'),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const CircularProgressIndicator();
                }
                var ledgers = snapshot.data as List;
                return Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: ledgers.map((ledger) {
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SpendingsPage()),
                        );
                      },
                      child: SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image.network(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgIWwryUUArHF_DWOh2Xxkg_X96SC-BbMiWp1DrNTYgpBH7AJ3G8q_w_XjKdAJSLh4pW0&usqp=CAU",
                                height: 50.0,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 20),
                                      child: Text(ledger["title"],
                                          style: GoogleFonts.montserrat(
                                            color: const Color.fromRGBO(
                                                54, 54, 54, 1),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                          ),
                                          textAlign: TextAlign.left),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(ledger["subtitle"],
                                          style: GoogleFonts.montserrat(
                                            color: const Color.fromRGBO(
                                                54, 54, 54, 1),
                                            fontWeight: FontWeight.w300,
                                            fontSize: 15,
                                          ),
                                          textAlign: TextAlign.left),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(ledger["debit"],
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 244, 92, 92),
                                            fontSize: 16)),
                                    Text(ledger["credit"],
                                        style: GoogleFonts.montserrat(
                                            color: const Color.fromARGB(
                                                255, 138, 207, 84),
                                            fontSize: 16))
                                  ]),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList());
              },
            )
          ],
        ),
      ),
    );
  }
}
