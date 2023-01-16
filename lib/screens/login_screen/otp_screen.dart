import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/user_model.dart';
import 'package:laundry_app/screens/home_screen/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  String phoneNumber;

  OtpScreen({super.key, required this.phoneNumber});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();
  String verificationIdReceived = "******";
  final _formKey = GlobalKey<FormState>();
  final focusNode = FocusNode();
  void initState() {
    super.initState();

    verifyPhone();
    print("OTP sent");
  }

  @override
  void dispose() {
    otpController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Colors.white;
    const fillColor = Colors.white;
    const borderColor = Colors.white;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xff212427),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * .5,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/login_screen_bubble.png"),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * .12,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 100, child: Image.asset('assets/wlogo.png')),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          "Please enter the OTP send to \n${widget.phoneNumber}",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff207B94)),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FractionallySizedBox(
                        widthFactor: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Directionality(
                              // Specify direction if desired
                              textDirection: TextDirection.ltr,
                              child: Pinput(
                                length: 6,
                                controller: otpController,
                                focusNode: focusNode,
                                androidSmsAutofillMethod:
                                    AndroidSmsAutofillMethod.smsUserConsentApi,
                                listenForMultipleSmsOnAndroid: true,
                                defaultPinTheme: defaultPinTheme,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Enter valid OTP";
                                  }
                                  if (value.length < 6) {
                                    return "Enter valid OTP";
                                  }
                                  return null;
                                },
                                // onClipboardFound: (value) {
                                //   debugPrint('onClipboardFound: $value');
                                //   pinController.setText(value);
                                // },
                                hapticFeedbackType:
                                    HapticFeedbackType.lightImpact,
                                onCompleted: (pin) {
                                  debugPrint('onCompleted: $pin');
                                },
                                onChanged: (value) {
                                  debugPrint('onChanged: $value');
                                },
                                cursor: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(bottom: 9),
                                      width: 22,
                                      height: 1,
                                      color: focusedBorderColor,
                                    ),
                                  ],
                                ),
                                disabledPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                focusedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                submittedPinTheme: defaultPinTheme.copyWith(
                                  decoration:
                                      defaultPinTheme.decoration!.copyWith(
                                    color: fillColor,
                                    borderRadius: BorderRadius.circular(19),
                                    border:
                                        Border.all(color: focusedBorderColor),
                                  ),
                                ),
                                errorPinTheme: defaultPinTheme.copyBorderWith(
                                  border: Border.all(color: Colors.redAccent),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      button(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            verifyOtp();
                          }
                        },
                        name: "Submit",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            Text(
                              "Back",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding button({required VoidCallback onPressed, required String name}) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50),
            elevation: 0,
            backgroundColor: Color(0xff207B94),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            name,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          )),
    );
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
    userModel.id = user!.uid;
    userModel.phoneNumber = widget.phoneNumber;
    final booking = <String, String>{"userId": user.uid};

    await firebase.collection("user").doc(user.uid).set(userModel.toJson());
    final ref = await firebase.collection("bookings").doc(user.uid).get();
    if (ref.exists == false) {
      await firebase.collection("bookings").doc(user.uid).set(booking);
    }
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

  createBookingDoc() {}
}
