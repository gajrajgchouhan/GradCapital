import 'package:flutter/material.dart';
import 'package:gc_frontend/read_json.dart';
import 'package:gc_frontend/screens/ledger/group/inviteMember.dart';
import 'package:gc_frontend/screens/ledger/transcation.dart';
import 'package:gc_frontend/screens/ledger/group/addMember.dart';
import 'package:gc_frontend/screens/ledger/group/inviteMember.dart';
import 'package:google_fonts/google_fonts.dart';

class MembersPage extends StatefulWidget {
  const MembersPage({super.key});

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  final _title = "Group Settings";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
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
                            )),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.settings,
                          color: Color.fromRGBO(54, 54, 54, 1),
                          size: 22.0,
                        )),
                  ]),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "B Tech 2021",
                        style: GoogleFonts.montserrat(
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "Freshers' Party 22",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "Edit",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Participants",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  InkWell(
                    onTap: null,
                    child: Icon(Icons.search),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_add,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Add / Edit Admins",
                        style: GoogleFonts.montserrat(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InviteMember()),
                        );
                      // showModalBottomSheet(
                      //     isScrollControlled: true,
                      //     backgroundColor: Colors.transparent,
                      //     shape: const RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.vertical(
                      //         top: Radius.circular(20),
                      //       ),
                      //     ),
                      //     context: context,
                      //     // builder: (context) => const AddMember());
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add / Edit Members",
                            style: GoogleFonts.montserrat(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
            FutureBuilder(
                future: readJson("assets/data/members.json"),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    var members = snapshot.data as List<dynamic>;
                    return Column(
                        children: members.map((e) {
                      e["admin"] = e["role"] == "Admin";
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person_3_rounded,
                                          color: Colors.black),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            e["name"]!,
                                            style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Text(e["admin"]! ? "Admin" : "",
                                              style: GoogleFonts.montserrat(
                                                fontSize: 12,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Text(
                                      e["message"]!,
                                      textAlign: TextAlign.right,
                                      style: GoogleFonts.montserrat(
                                          // fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: e["credit"]!
                                              ? Colors.green
                                              : Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (e["admin"]!)
                              Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward_ios),
                                ],
                              )
                            else
                              SizedBox(
                                width: 0,
                                height: 0,
                              )
                          ],
                        ),
                      );
                    }).toList());
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })),
          ],
        ),
      )),
    );
  }
}
