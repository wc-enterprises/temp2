import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen3.dart';
import 'package:laundry_app/widgets/address_picker.dart';
import 'package:laundry_app/widgets/date_and_time_picker.dart';
import 'package:provider/provider.dart';

class OrderScreen2 extends StatefulWidget {
  OrderScreen2({super.key});

  @override
  State<OrderScreen2> createState() => _OrderScreen2State();
}

class _OrderScreen2State extends State<OrderScreen2> {
  List<Address> address = [
    Address(
        streetOrAppartmentName: "akshaya",
        addressTitle: "home",
        doorNumber: "c2-603",
        area: "Urapakkam chennai guindy thambaram",
        district: "chennai",
        pincode: "603210"),
    Address(
        addressTitle: "work",
        streetOrAppartmentName: "safa",
        doorNumber: "13",
        area: "Jp nagar",
        district: "bangalore",
        pincode: "560076")
  ];
  List<String> timeSlot = [
    "9am-12pm",
    "12pm-2pm",
    "2pm-4pm",
    "4pm-6pm",
    "6pm-8pm"
  ];

  //////////////////////////////////////////////////////////////
  DateTime _selectedDay = DateTime.now();
  DatePickerController _controller = DatePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff3B4158),
        body:
            // Consumer<OrderScreen1ViewModel>(
            //   builder: ((context, _, child) {
            //     return
            SafeArea(
                child: SingleChildScrollView(
          child: Column(
            children: [
              AddressPicker(
                addresses: address,
                title: "Pick-up address",
              ),
              DateTimeSlotPicker(
                timeSlots: timeSlot,
              ),
              AddressPicker(
                addresses: address,
                title: "Delivery address",
              ),
              DateTimeSlotPicker(
                timeSlots: timeSlot,
              ),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xff486D98)),
                    ),
                    onPressed: () {
                      address.forEach((element) {
                        // print(element.selectedColor);
                      });
                      Provider.of<OrderScreen1ViewModel>(context, listen: false)
                          .filterTimeSlot(timeSlot);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: ((context) => OrderScreen3())));
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 43, right: 43),
                        child: Text("Next"))),
              ),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Color(0xff486D98)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                        padding: EdgeInsets.only(
                            top: 13, bottom: 13, left: 43, right: 43),
                        child: Text("Back"))),
              )
            ],
          ),
          //   ));
          // }
        )));
  }
}
