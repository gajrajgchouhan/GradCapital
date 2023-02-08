import 'package:flutter/material.dart';
import 'package:gc_frontend/screens/ledger/group/inviteMemberModel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class InviteMember extends StatefulWidget {
 const InviteMember({super.key});

  @override
  State<InviteMember> createState() => _InviteMemberState();
}

class _InviteMemberState extends State<InviteMember> {
  final _title = "Invite New Member";
  final _formKey = GlobalKey<FormState>();
  InviteMemberModel iModel = InviteMemberModel(
    title: '',
    note: '',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10),
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
                              Icons.close,
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
                      child: Text("SAVE",
                          style: GoogleFonts.montserrat(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ]),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: 'Invite Title',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(179, 177, 177, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                            )),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          iModel.title = value!;
                        },
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .8,
                              height: MediaQuery.of(context).size.width * .3,
                              child: InkWell(
                                onTap: () async {
                                  final result =
                                      await FilePicker.platform.pickFiles();
                                },
                                child: Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color.fromRGBO(143, 185, 245, 1),
                                          Color.fromRGBO(186, 211, 246, 1),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomLeft,
                                      ),
                                      borderRadius: BorderRadius.circular(27.0),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black,
                                          spreadRadius: -7,
                                          blurRadius: 15,
                                          // offset: const Offset(0, -7),
                                        ),
                                      ],
                                    ),
                                    child: const Icon(
                                      Icons.image,
                                      color: Color.fromRGBO(66, 136, 233, 1),
                                      size: 40.0,
                                      weight: 10,
                                    )),
                              )),
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        "ADD BANNER",
                        style: GoogleFonts.montserrat(
                          color: Colors.blue,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      )),
                  Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.speaker_notes_outlined,
                              color: Color.fromRGBO(179, 177, 177, 1),
                              size: 30.0,
                            ),
                            border: UnderlineInputBorder(),
                            labelText: 'Add a note',
                            labelStyle: TextStyle(
                              color: Color.fromRGBO(179, 177, 177, 1),
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily: 'Montserrat',
                            )),
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          iModel.title = value!;
                        },
                      )),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          _formKey.currentState?.save();
                          print("debugggggggg");
                          // AppSettings.of(context).addTranscation(iModel).then((value) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(content: Text('Saved!')),
                          // );

                          //   Navigator.pop(context);
                          //   Navigator.pop(context);
                          // });
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.blue),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ))),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: MediaQuery.of(context).size.width * 0.7,
                          child: Text(
                            'SEND-IN APP INVITE',
                            style: GoogleFonts.montserrat(
                                fontSize: 13, fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  )),
                  Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: TextButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          await Clipboard.setData(const ClipboardData(
                                  text: "https://www.google.com/"))
                              .then((value) =>
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Copied Link to Clipboard')),
                                  ));
                          _formKey.currentState?.save();
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              const MaterialStatePropertyAll<Color>(
                                  Colors.white),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: const BorderSide(
                                          color: Colors.blue, width: 2)))),
                      child: Container(
                          padding: const EdgeInsets.all(5),
                          width: MediaQuery.of(context).size.width * 0.73,
                          child: Text(
                            'GENERATE LINK',
                            style: GoogleFonts.montserrat(
                                color: Colors.blue,
                                fontSize: 13,
                                fontWeight: FontWeight.w700),
                            textAlign: TextAlign.center,
                          )),
                    ),
                  )),
                ],
              ),
            )
          ],
        ),
      ))),
    );
  }
}
