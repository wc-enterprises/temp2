import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/user_model.dart';
import 'package:laundry_app/screens/home_screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OtpScreen extends StatefulWidget {
  String phoneNumber;
  String name;
  OtpScreen({super.key, required this.phoneNumber, required this.name});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();
  String verificationIdReceived = "******";
  final _formKey = GlobalKey<FormState>();
  void initState() {
    super.initState();

    verifyPhone();
    print("OTP sent");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 34),
                  Text(
                    "Enter OPT sent to phone number ${widget.phoneNumber}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: otpController,
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      hintText: "Enter your OTP",
                      hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      prefix: const Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                      suffixIcon: const Icon(
                        Icons.password,
                        color: Colors.yellow,
                        size: 32,
                      ),
                    ),
                    maxLength: 6,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter valid OTP";
                      }
                      if (value.length < 5) {
                        return "Enter valid OTP";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          verifyOtp();
                        }
                        //
                        // }
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Verify OTP',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.yellow),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(14.0),
                        child: Text(
                          'Back',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  verifyPhone() {
    auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException exception) {
        if (exception.code == 'invalid-phone-number') {
          showSnackBarText('The provided phone number is not valid.');
        }

        if (exception.code == 'invalid-verification-code') {
          showSnackBarText("Incorrect OPT");
          print(exception.code);
        }

        print(exception.code);
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        verificationIdReceived = verificationId;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verifyOtp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationIdReceived, smsCode: otpController.text);
    signInWithPhoneAuthCredential(credential);
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        saveUserData();
        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => HomeScreen())));
        showSnackBarText("Logged in successfully");
      }
    } on FirebaseAuthException catch (e) {
      showSnackBarText("Invalid OTP");
      print(e.message);
    }
  }

  saveUserData() async {
    print("saveUserData called");
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    User? user = auth.currentUser;

    UserModel userModel = UserModel();
    userModel.name = widget.name;
    userModel.id = user!.uid;
    userModel.phoneNumber = widget.phoneNumber;
    userModel.address = [
      Address(
          addressTitle: "home",
          streetOrAppartmentName: "akshaya",
          doorNumber: "c2606",
          area: "urapakkam",
          district: "chennai",
          pincode: "603210")
    ];

    await firebase.collection("user").doc(user.uid).set(userModel.toJson());
    print("Account created successfully");
  }

  void showSnackBarText(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey,
        content: Text(text),
      ),
    );
  }
}
