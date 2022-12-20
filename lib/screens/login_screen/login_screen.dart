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
      backgroundColor: Colors.black,
      body: SafeArea(
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
    );
  }

  textfield(controller, TextInputType inputType, error, maxLength, minLength,
      IconData icon, hintText) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w200),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(30)),
        prefix: const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "",
            style: TextStyle(
              color: Colors.black26,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        suffixIcon: Icon(
          icon,
          color: Colors.yellow,
          size: 32,
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
