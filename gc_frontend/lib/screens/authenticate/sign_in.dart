import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
class SignIn extends StatefulWidget {
  //final Function toggleView;
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  final focus1 = FocusNode();
  String email = '';
  String password = '';
  String phoneNumber = '';
  String smsCode = '';

  bool showVerifyNumberWidget = true;
  bool showVerificationCodeWidget = false;

  void displayMessage(String message) {
    final snackBar =SnackBar(content: Text(message), duration: const Duration(seconds: 20),action: SnackBarAction(
      label: "X",
              onPressed: () {
                // Some code to undo the change.
              },
            ),);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // screenHeight = MediaQuery.of(context).size.height;
    // screenWidth = MediaQuery.of(context).size.width;
    return  Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0.0,
                title: const Text("Sign In With Moi"),
                // Image.asset('',
                    // width: 85.0, height: 85.0)
                /*
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  style: TextButton.styleFrom(primary: Colors.white),
                  onPressed: () => widget.toggleView(),
                ),
              ],*/
                ),
            body: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      reverse: false,
                      child: Column(
                    children: <Widget>[
                      // FittedBox(
                      //     fit: BoxFit.contain,
                      //     child: ClipRRect(
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       child: Image.asset(
                      //         'a',
                      //       ),
                      //     )),
                      const SizedBox(height: 10.0),
                      if (showVerifyNumberWidget)
                        Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                  // hintText: '10 Digit Phone Number',
                                  border: Border.all(
                                      color: const Color.fromRGBO(03, 43, 68, 1),
                                      width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          10.0) //                 <--- border radius here
                                      ),
                                ),
                                child: ListTile(
                                  leading: const Text(
                                    '+91',
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(03, 43, 68, 1),
                                        fontSize: 20),
                                  ),
                                  title: TextFormField(
                                    focusNode: focus1,
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration:
                                        textInputDecoration.copyWith(
                                      hintText: "10_digit_phone_no",
                                          hintStyle: const TextStyle(fontSize: 18),
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    style:const  TextStyle(fontSize: 21),
                                    validator: (val) => val?.length != 10
                                        ? 
                                                "Enter 10 digit PhNo"
                                        : null,
                                    onChanged: (val) {
                                      setState(() => phoneNumber = val);
                                    },
                                  ),
                                ))),
                     const  SizedBox(height: 15.0),
                      if (showVerifyNumberWidget)
                        SizedBox(
                          height: 55,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(12),
                               backgroundColor: const Color.fromRGBO(03, 43, 68, 1),
                              ),
                              child: const Text("Verify Number",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              onPressed: () async {
                                // await _auth.verifyPhoneNumber(
                                //     phoneNumber, context);
                                displayMessage("check sms");
                                setState(() {
                                  showVerifyNumberWidget = false;
                                  showVerificationCodeWidget = true;
                                });
                              }),
                        ),
                      if (showVerificationCodeWidget) const SizedBox(height: 15.0),
                      if (showVerificationCodeWidget)
                        Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                                decoration: BoxDecoration(
                                  //hintText: '10 Digit Phone Number',
                                  border: Border.all(
                                      color:const  Color.fromRGBO(03, 43, 68, 1),
                                      width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(
                                          10.0) //                 <--- border radius here
                                      ),
                                ),
                                child: ListTile(
                                  title: TextFormField(
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    decoration:
                                        textInputDecoration.copyWith(
                                      hintText:"6 digit code",
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                    ),
                                    validator: (val) => val?.length != 6
                                        ? 
                                                "Enter 6 digit code"
                                        : null,
                                    onChanged: (val) {
                                      setState(() => smsCode = val);
                                    },
                                  ),
                                ))),
                      if (showVerificationCodeWidget)const SizedBox(height: 15.0),
                      if (showVerificationCodeWidget)
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(12),
                                backgroundColor: const Color.fromRGBO(03, 43, 68, 1),
                              ),
                              child: const Text("Sign In",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 22),
                              ),
                              onPressed: () async {
                                // if (_formKey.currentState.validate()) {
                                  // await _auth.signInWithPhoneNumber(
                                  //     smsCode, phoneNumber, context);
                                  // displayMessage("success_signed_in");
                                // }
                              }),
                        ),
                      const SizedBox(height: 20.0),
                      if (showVerificationCodeWidget)SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding: const EdgeInsets.all(12),
                                primary: Colors.white,
                              ),
                              child: const Text(
                                "Try again",
                                style: TextStyle(
                                    color: Color.fromRGBO(03, 43, 68, 1), fontSize: 15),
                              ),
                              onPressed: () async {
                                setState(() {
                                  showVerifyNumberWidget = true;
                                  showVerificationCodeWidget = false;
                                });
                              }),
                        ),
                      // if (showVerifyNumberWidget)const Text("or"),
                      // const SizedBox(height: 15.0),
                      
                    ],
                      ),
                    )),
              ),
            ));
  }
}
