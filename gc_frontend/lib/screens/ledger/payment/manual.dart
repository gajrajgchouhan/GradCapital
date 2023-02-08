import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gc_frontend/AppSettings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gc_frontend/screens/ledger/payment/model.dart';
import 'package:image_picker/image_picker.dart';

class ManualEntry extends StatefulWidget {
  const ManualEntry({super.key});

  @override
  State<ManualEntry> createState() => _ManualEntryState();
}

class _ManualEntryState extends State<ManualEntry> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model(
      title: '',
      uploader: '',
      vendor: '',
      payMethod: '',
      debit: '500',
      gstNo: '',
      gstAmt: '',
      bill: '');
  late bool check = false;

  /// Get from gallery
  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        print("setting bill to selected file");
        model.bill = pickedFile.path;
        print(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      // title: Text(widget.title,
      //     style: const GoogleFonts.montserrat(
      //         color: Color.fromRGBO(50, 63, 75, 1),
      //         fontWeight: FontWeight.bold)),
      // ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                  padding: const EdgeInsets.only(top: 40, left: 10),
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
                            Text("New Manual Transaction",
                                style: GoogleFonts.montserrat(
                                  color: const Color.fromRGBO(54, 54, 54, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ]))),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                    child: TextFormField(
                         controller: TextEditingController(text: "Drinks"),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Title',
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
                        model.title = value!;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                            controller: TextEditingController(text: "Prati"),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Your Name',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(179, 177, 177, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                        model.uploader = value!;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: Column(
                      children: [
                        Text("UPLOAD DOCUMENTS",
                            style: GoogleFonts.montserrat(
                                color: const Color.fromRGBO(244, 106, 92, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w700))
                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 25, top: 20, bottom: 20),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.width * .3,
                            child: check == false
                                ? Card(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                    ),
                                    elevation: 8,
                                    child: InkWell(
                                      onTap: () async {
                                        _getFromGallery();
                                        setState(() {
                                          check = true;
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              255, 226, 223, 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      border: Border.all(
                                                        color: const Color
                                                                .fromRGBO(
                                                            250, 166, 158, 1),
                                                        width: 2,
                                                      )),
                                                  child: const Icon(
                                                    Icons.receipt,
                                                    color: Color.fromRGBO(
                                                        250, 166, 158, 1),
                                                    size: 20.0,
                                                    weight: 10,
                                                  )),
                                              Padding(
                                                  padding: const EdgeInsets
                                                      .only(top: 10),
                                                  child: Text("BILLS",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color
                                                                      .fromRGBO(
                                                                  179,
                                                                  179,
                                                                  179,
                                                                  1))))
                                            ]),
                                      ),
                                    ))
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * .25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Image.file(
                                      File(model.bill),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.width * .3,
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                elevation: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    255, 226, 223, 1),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      250, 166, 158, 1),
                                                  width: 2,
                                                )),
                                            child: const Icon(
                                              Icons.check,
                                              color: Color.fromRGBO(
                                                  250, 166, 158, 1),
                                              size: 20.0,
                                              weight: 10,
                                            )),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text("PROOF OF PAYMENTS",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromRGBO(
                                                        179, 179, 179, 1))))
                                      ]),
                                ))),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            height: MediaQuery.of(context).size.width * .3,
                            child: Card(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                elevation: 8,
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            padding: const EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                                color: const Color.fromRGBO(
                                                    255, 226, 223, 1),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                border: Border.all(
                                                  color: const Color.fromRGBO(
                                                      250, 166, 158, 1),
                                                  width: 2,
                                                )),
                                            child: const Icon(
                                              Icons.image,
                                              color: Color.fromRGBO(
                                                  250, 166, 158, 1),
                                              size: 20.0,
                                              weight: 10,
                                            )),
                                        Padding(
                                            padding:
                                                const EdgeInsets.only(top: 10),
                                            child: Text("PICTURES",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: const Color.fromRGBO(
                                                        179, 179, 179, 1))))
                                      ]),
                                ))),
                      ],
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: TextFormField(
                         controller: TextEditingController(text: "Trago"),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Vendor Name',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(179, 177, 177, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                        model.vendor = value!;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: TextFormField(
                         controller: TextEditingController(text: "Cash"),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Mode of Payment',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(179, 177, 177, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          )),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.payMethod = value!;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: TextFormField(
                      // enabled: false,
                      controller: TextEditingController(text: "500"),

                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          // hintText: "500",
                          labelText: 'Amount (Incl. GST)',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(179, 177, 177, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          )),
                      // The validator receives the text that the user has entered.
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        model.debit = value!;
                      },
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: TextFormField(
                         controller: TextEditingController(text: "57654982198"),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'GSTIN Number',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(179, 177, 177, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                        model.gstNo = value!;
                      },
                    )),
                Padding(
                  
                    padding: const EdgeInsets.only(left: 25, top: 20),
                    child: TextFormField(
                         controller: TextEditingController(text: "50"),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: 'Total GSTIN',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(179, 177, 177, 1),
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
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
                        model.gstAmt = value!;
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
                        AppSettings.of(context)
                            .addTranscation(model)
                            .then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Saved!')),
                          );

                          Navigator.pop(context);
                          Navigator.pop(context);
                        });
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color.fromRGBO(246, 126, 114, 1)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ))),
                    child: Container(
                        padding: const EdgeInsets.all(12),
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Text(
                          'CREATE',
                          style: GoogleFonts.montserrat(
                              fontSize: 13, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        )),
                  ),
                )),
              ],
            ),
          )
        ],
      )),
    );
  }
}
