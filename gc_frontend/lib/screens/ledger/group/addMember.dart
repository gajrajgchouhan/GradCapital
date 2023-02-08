import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gc_frontend/AppSettings.dart';
import 'package:gc_frontend/screens/ledger/scanQR.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';
import 'package:gc_frontend/read_json.dart';
import 'dart:convert';
import 'package:badges/badges.dart' as BadgesModule;
import 'package:gc_frontend/screens/ledger/group/member.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class AddMember extends StatefulWidget {
  const AddMember({super.key});

  @override
  State<AddMember> createState() => _AddMemberState();
}

class _AddMemberState extends State<AddMember> {
  late String name;
  late Member member = Member(name: "");
  late List<dynamic> allMembers;

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Cancel",
                                style: GoogleFonts.montserrat(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600)))),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text("Add Participants",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w600))),
                    InkWell(
                        onTap: () {
                          if (member.name != "") {
                            AppSettings.of(context).addMember(member);
                          }
                        },
                        child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text("Add",
                                style: GoogleFonts.montserrat(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600))))
                  ],
                ),
                const SizedBox(height: 10),
                SizedBox(
                  // top: 30.0,
                  // right: 15.0,
                  // left: 15.0,
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Enter Name",
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.only(left: 15.0, top: 15.0),
                          prefixIcon: IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {},
                              iconSize: 30.0)),
                      onChanged: (val) async {
                        setState(() {
                          name = val;
                        });
                        final String response = await rootBundle
                            .loadString("assets/data/allmember.json");
                        final data = await json.decode(response);
                        setState(() {
                          allMembers = data;
                        });
                        for (var a in allMembers) {
                          if (a["name"] == name) {
                            setState(() {
                              member = Member(name: a["name"]);
                            });
                          }
                        }
                        //  if(allMembers.contains(name)){

                        //  }
                      },
                    ),
                  ),
                ),
                if (member.name != "")
                  InkWell(
                      onTap: () {
                        setState(() {
                          member.name = "";
                        });
                      },
                      child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BadgesModule.Badge(
                                    position:
                                        BadgesModule.BadgePosition.topEnd(),
                                    badgeContent: Text(
                                      "X",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // backgroundColor: const Color.fromRGBO(255, 64, 64, 1),
                                    child: const Icon(
                                      Icons.person_2_rounded,
                                      color: Color.fromRGBO(113, 113, 113, 1),
                                      size: 35.0,
                                      weight: 10,
                                    )),
                                Text(
                                  member.name,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ]))),
                // Padding(
                //     padding: const EdgeInsets.all(10),
                //     child: Text("Forever ❤️",
                //         style: GoogleFonts.montserrat(
                //             fontSize: 22, fontWeight: FontWeight.w600),
                //         textAlign: TextAlign.center)),
                PreferenceBuilder(
                    preference: AppSettings.of(context).members,
                    builder: ((context, members) {
                      if (members.isNotEmpty) {
                        // var members = snapshot.data as List<dynamic>;
                        // setState(() {
                        //   allMembers = members;
                        // });
                        print("Members");
                        print(members);
                        return Column(
                            children: members.map((e) {
                          e["admin"] = e["role"] == "Admin";
                          return Column(children: [
                            Row(children: [
                              const Icon(
                                Icons.person_2_rounded,
                                color: Color.fromRGBO(113, 113, 113, 1),
                                size: 35.0,
                                weight: 10,
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(e["name"]!,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600))),
                            ]),
                            const Divider(color: Colors.black),
                          ]);
                        }).toList());
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })),
              ]));
        });
  }
}
