import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/screens/login_screen/otp_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff212427),
      body: SafeArea(
        child: Stack(
          children: 
          [Positioned(
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
                      height: 100,
                      
                      child: Image.asset('assets/wlogo.png')),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text("We need to send OTP to authenticate\nyour number", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xff207B94)),),
                    ),
                    SizedBox(height: 30,),
                    Text("Enter 10 digit mobile", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),),
                    SizedBox(height: 5,),
                        
                        textfield(phoneController,
                    TextInputType.number,
                    "Enter valid phone number",
                    10,
                    10,
                    
                    "Ind(+91)"),
                        
                        Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState!.validate()) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return OtpScreen(
                            phoneNumber: "+91${phoneController.text}",
                            
                          );
                        })));
                      }
                      },
                      
                      style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50),elevation: 0, backgroundColor: Color(0xff207B94), shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),), 
                      child: Text("Next", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),)),
                  ),
                  ],
                ),
              ),
            ),
          ),
        ],),
        ),
    );
  }

  textfield(controller, TextInputType inputType, error, maxLength, minLength,
       hintText) {
    return TextFormField(
      
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(
        color: Color(0xff212427),
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        counterStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        focusColor: Color(0xff212427),
        hintStyle: TextStyle(
          
            fontSize: 16, fontWeight: FontWeight.w200),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(),
            borderRadius: BorderRadius.circular(20)),
        prefix: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Text(
            "",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        
      ),
      maxLength: maxLength,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return error;
        }
        if (value.length < minLength) {
          return error;
        }
        return null;
      },
    );
  }
}
/*
SafeArea(
          child: Center(
              child: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              textfield(nameController, TextInputType.text, "enter valid name",
                  20, 3, Icons.person, "Hello, what's your name"),
              SizedBox(
                height: 20,
              ),
              textfield(
                  phoneController,
                  TextInputType.number,
                  "Enter valid phone number",
                  10,
                  10,
                  Icons.phone_android,
                  "Enter your phone number"),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((context) {
                        return OtpScreen(
                          phoneNumber: "+91${phoneController.text}",
                          name: nameController.text,
                        );
                      })));
                    }
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.yellow),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(14.0),
                    child: Text(
                      'Send OTP',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ))),
      */