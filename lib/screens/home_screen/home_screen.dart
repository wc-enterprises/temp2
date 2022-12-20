import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/models/address_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //Address dropdownValue = address[0];

    return Scaffold(
        backgroundColor: Color(0xffF5F4EE),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 28, right: 28, top: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "HOME",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                  Spacer(),
                  CircleAvatar(
                      backgroundColor: Color(0xff486D98),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ))),
                ],
              ),
              SizedBox(height: 16),
              Text("Hi, Abin"),
              SizedBox(height: 16),
              Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: const Text(
                    "Get done your laundry in just 3 steps",
                    style: TextStyle(
                        color: Color(0xff11044C),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )),
              Padding(
                padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                    left: MediaQuery.of(context).size.width / 1.5),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      textAlign: TextAlign.left,
                    )),
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
              )
            ]),
          ),
        ));
  }
}
