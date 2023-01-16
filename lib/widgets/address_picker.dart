import 'package:flutter/material.dart';
import 'package:laundry_app/isar_service.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/widgets/address_button.dart';
import 'package:provider/provider.dart';

class AddressPicker extends StatefulWidget {
  List<Address> addresses;
  String title;
  AddressPicker({
    super.key,
    required this.addresses,
    required this.title,
  });

  @override
  State<AddressPicker> createState() => _AddressPickerState();
}

class _AddressPickerState extends State<AddressPicker> {
  int selectedIndex = -1;
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(21),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
          color: Color(0xff292F34),
        ),
        width: double.infinity,
        child: ExpansionTile(
            backgroundColor: Color(0xff292F34),
            title: Container(
              height: 70,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.only(top: 21, left: 10, bottom: 21),
                child: Row(children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Icon(
                    Icons.check,
                    color:
                        selectedIndex == -1 ? Colors.transparent : Colors.grey,
                  ),
                ]),
              ),
            ),
            children: [
              addressBox(context),
              Container(
                margin: EdgeInsets.only(bottom: 10, left: 20, right: 10),
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      bottomSheet(context);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff486D98))),
                    child: const Text("Add new address",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600))),
              )
            ]),
      ),
    );
  }

  Widget addressBox(context) {
    return Consumer<OrderScreen1ViewModel>(builder: ((context, _, child) {
      return FutureBuilder(
          future: service.futureAddress(),
          builder: (context, snapshot) {
            if (snapshot.data?.length != 0) {
              return Wrap(
                  children: List.generate(
                snapshot.data!.length,
                (index) => Padding(
                  padding: EdgeInsets.only(left: 20, right: 10),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        print("address selected");

                        selectedIndex = index;
                        if (widget.title == "Pick-up address") {
                          context
                              .read<OrderScreen1ViewModel>()
                              .selectPickupAddress(snapshot.data![index]);
                        }
                        if (widget.title == "Delivery address") {
                          context
                              .read<OrderScreen1ViewModel>()
                              .selectDeliveryAddress(snapshot.data![index]);
                        }
                        //print(widget.addresses[index].isSelected);
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.white
                              : Color(0xff292F34),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(
                            color: selectedIndex == index
                                ? Color(0xff292F34)
                                : Colors.white,
                          )),
                      margin: EdgeInsets.only(bottom: 19),
                      height: 52,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              "${snapshot.data![index].doorNumber}, ${snapshot.data![index].street}, ${snapshot.data![index].area}, ${snapshot.data![index].district}, ",
                              style: TextStyle(
                                height: 1.4,
                                color: selectedIndex == index
                                    ? Colors.black
                                    : Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.check,
                            color: selectedIndex == index
                                ? Color(0xff596C31)
                                : Colors.transparent,
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ));
            }
            {
              return const Text(
                "No address to show",
                style: TextStyle(
                  height: 1.4,
                  color: Colors.white,
                  fontSize: 12,
                ),
              );
            }
          });
    }));
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
                          textfield(pincodeController, "District*", ""),
                          textfield(titleController, "Address title",
                              "eg: HOME, WORK..."),
                        ])),
                    AddressButton(
                        name: "Save and Continue",
                        onPressed: () async {
                          final isar = await service.db;

                          print(selectedLocation);

                          if (_formKey.currentState!.validate() &&
                              selectedLocation != null) {
                            Address address = Address(
                                area: selectedLocation.toString(),
                                doorNumber: doorController.text,
                                district: pincodeController.text,
                                addressTitle: titleController.text,
                                landmark: landmarkController.text,
                                //  pincode: pincodeController.text,
                                addressId:
                                    "${doorController.text}${streetController.text}",
                                street: streetController.text);

                            print(address.addressId);
                            service.addAddress(address);
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
}
