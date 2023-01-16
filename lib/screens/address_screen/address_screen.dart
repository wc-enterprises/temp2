import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:isar/isar.dart';
import 'package:laundry_app/isar_service.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/widgets/address_button.dart';
import 'package:laundry_app/widgets/address_title.dart';
import 'package:laundry_app/widgets/bottom_sheet.dart';
import 'package:laundry_app/widgets/saved_location.dart';

import '../../dummy_data.dart';

class Address_Page extends StatefulWidget {
  const Address_Page({Key? key}) : super(key: key);

  @override
  State<Address_Page> createState() => _Address_PageState();
}

class _Address_PageState extends State<Address_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_left_rounded)),
        centerTitle: true,
        foregroundColor: Theme.of(context).secondaryHeaderColor,
        title: Text("Your Addresses"),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            AddressButton(
              name: "+ Add New Address",
              onPressed: () {
                bottomSheet(context);
              },
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            Padding(
                padding: EdgeInsets.only(left: 20, bottom: 10),
                child: Text(
                  "Saved Location",
                  style: Theme.of(context).textTheme.headline3,
                )),
            SavedLocation()
          ],
        ),
      ),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    List<String> locations = [
      "Guduvannchery",
      "Urappakkam",
      "Potheri",
    ];
    TextEditingController doorController = TextEditingController();
    TextEditingController streetController = TextEditingController();
    TextEditingController landmarkController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    TextEditingController titleController = TextEditingController();

    int selectedIndex = 0;
    String? selectedLocation;
    final _formKey = GlobalKey<FormState>();
    final service = IsarService();
    Address address;
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return AddressBottomSheet();
        });
//Address TextField
  }
}
