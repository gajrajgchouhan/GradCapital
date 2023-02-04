
// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.tealAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(10)),
  ),
);

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  // bool loading = false;


  final focus1 = FocusNode();
  final focus2 = FocusNode();
  final focus3 = FocusNode();

  String name='';
  String phone ='';
  String gender ='';
  String age='';
  int genderRadio=0;
  @override
  void initState() {
    super.initState();
    genderRadio = 0;
    // fromregistered = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[900],
          elevation: 0.0,
          title: const Text("Sign Up With Moi"),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              reverse: false,
              child: Column(
                children: <Widget>[
                  // FittedBox(
                  //   fit: BoxFit.fill,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.circular(10.0),
                  //     child: Image.asset('',),
                  //   ),
                  // ),
                  const SizedBox(height: 10.0),
                 
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      focusNode: focus1,
                      // initialValue: userData.name,
                      decoration: textInputDecoration.copyWith(
                        labelText: "your Name",
                        enabledBorder:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(15.0),
                          // borderSide:
                          //     BorderSide(color: Colors.teal[50]),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          // borderSide:
                          //     BorderSide(color: Colors.teal[900]),
                        ),
                      ),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus2);
                      },
                      // ignore: prefer_is_empty
                      validator: (val) =>
                          // ignore: prefer_is_empty
                          val?.length != 0 ? "Enter valid name" : null,
                      onChanged: (val) {
                        setState(() => name = val);
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: TextFormField(
                      focusNode: focus2,
                      // initialValue: userData.phone,
                      decoration: textInputDecoration.copyWith(
                        labelText: "Phone No",
                        enabledBorder:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(15.0),
                          // borderSide:
                          //     BorderSide(color: Colors.teal[50]),
                        ),
                        focusedBorder:  OutlineInputBorder(
                          borderRadius:  BorderRadius.circular(15.0),
                          // borderSide:
                          //     BorderSide(color: Colors.teal[900]),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (v) {
                        FocusScope.of(context).requestFocus(focus3);
                      },
                      validator: (val) =>
                          val?.length != 10 ? "invalid_phone_no" : null,
                      onChanged: (val) {
                        setState(() => phone = val);
                      },
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  // Card(
                  //   elevation: 5,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(15.0),
                  //   ),
                  //   child: TextFormField(
                  //     focusNode: focus3,
                  //     readOnly: true,
                  //     enabled: true,
                  //     // initialValue: userData.age,
                  //     decoration: textInputDecoration.copyWith(
                  //       hintStyle: const TextStyle(
                  //         fontWeight: FontWeight.bold,
                  //         fontSize: 15.0,
                  //       ),
                  //       prefixText: age,
                  //       labelText: "Age",
                  //       prefixIcon: const Icon(Icons.calendar_today),
                  //       enabledBorder:  OutlineInputBorder(
                  //         borderRadius:  BorderRadius.circular(15.0),
                  //         // borderSide:
                  //         //     BorderSide(color: Colors.teal[50]),
                  //       ),
                  //       focusedBorder:  OutlineInputBorder(
                  //         borderRadius:  BorderRadius.circular(15.0),
                  //         // borderSide:
                  //         //     BorderSide(color: Colors.teal[900]),
                  //       ),
                  //     ),
                  //     // onTap: () => _selectDate(context),
                  //     onChanged: (val) {
                  //       setState(() => age = val);
                  //     },
                  //   ),
                  // ),
                  const SizedBox(height: 10.0),
                  const Text(
                    "gender",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 1,
                        groupValue: genderRadio,
                        onChanged: (val) {
                          setState(() {
                            genderRadio = val!;
                            gender = 'Male';
                          });
                        },
                      ),
                      const Text(
                        "male",
                        style: TextStyle(fontSize: 15.0),
                      ),
                      Radio(
                        value: 2,
                        groupValue: genderRadio,
                        onChanged: (val) {
                          setState(() {
                            genderRadio = val!;
                            gender = 'Female';
                          });
                        },
                      ),
                      const Text(
                        "female",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                      Radio(
                        value: 3,
                        groupValue: genderRadio,
                        onChanged: (val) {
                          setState(() {
                            genderRadio = val!;
                            gender = 'Other';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromRGBO(03, 43, 68, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: const EdgeInsets.all(12),
                        ),
                        child: const Text(
                          "register",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () async {
                   
                        }),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    error,
                    style: const TextStyle(color: Colors.red, fontSize: 10.0),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
