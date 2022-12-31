import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/widgets/address_button.dart';
import 'package:laundry_app/widgets/address_title.dart';
import 'package:laundry_app/widgets/saved_location.dart';

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
        title: Text("Your Location"),
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

    List<String> addressTitles = ["Home", "Work", "Other"];
    int selectedIndex = 0;
    String? selectedLocation;
    final _formKey = GlobalKey<FormState>();

    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight: Radius.circular(25.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      margin: EdgeInsets.all(20),
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff3B4158),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Select Area",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                color: Colors.white),
                          ),
                          DropdownButton(
                            iconEnabledColor: Colors.white,
                            underline: SizedBox(),
                            iconSize: 15,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                color: Colors.white),
                            dropdownColor: Color(0xff3B4158),
                            hint: const Text(
                              "Select Area",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Colors.white),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            value: selectedLocation,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 8,
                            isExpanded: true,
                            onChanged: (newValue) {
                              setModalState(() {
                                selectedLocation = newValue;
                              });
                            },
                            items: locations.map((location) {
                              return DropdownMenuItem(
                                child: new Text(location),
                                value: location,
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Form(
                        key: _formKey,
                        child: Column(children: [
                          textfield(doorController, "Door Number *", ""),
                          textfield(streetController,
                              "Street or Apartment Name*", ""),
                          textfield(landmarkController, "Landmark*", ""),
                          textfield(pincodeController, "Pincode*", ""),
                          textfield(titleController, "Address title",
                              "eg: HOME, WORK..."),
                        ])),
                    AddressButton(
                        name: "Save and Continue",
                        onPressed: () {
                          print(selectedLocation);

                          if (_formKey.currentState!.validate() &&
                              selectedLocation != null) {
                            Address address = Address(
                                area: selectedLocation.toString(),
                                doorNumber: doorController.text,
                                pincode: pincodeController.text,
                                addressTitle: addressTitles[selectedIndex],
                                streetOrAppartmentName: streetController.text);
                            print(address.addressTitle);
                          } else {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Please select your area'),
                                content: const Text(
                                    'If your area is not available in the list, we do not offer service in your area, please stay tuned'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'OK'),
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          }
                        })
                  ],
                ),
              ),
            );
          });
        });
  }
}

//Address TextField
textfield(
  controller,
  label,
  hint,
) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xff11044C)),
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            hintText: hint,
            counterStyle: TextStyle(color: Colors.transparent),
            prefix: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
          maxLength: 100,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Enter a valid data";
            }
            if (value.length < 2) {
              return "Enter a valid data";
            }
            return null;
          },
        ),
      ],
    ),
  );
}
