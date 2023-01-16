import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:laundry_app/isar_service.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:intl/intl.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen1.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen3.dart';
import 'package:laundry_app/widgets/bottom_sheet.dart';
import 'package:laundry_app/widgets/date_and_time_picker.dart';
import 'package:laundry_app/widgets/home_basket.dart';
import 'package:laundry_app/widgets/pickup_address.dart';
import 'package:provider/provider.dart';

class OrderScreen2 extends StatefulWidget {
  OrderScreen2({super.key});

  @override
  State<OrderScreen2> createState() => _OrderScreen2State();
}

class _OrderScreen2State extends State<OrderScreen2> {
  final service = IsarService();

  List<String> timeSlot = [
    "9am-12pm",
    "12pm-2pm",
    "2pm-4pm",
    "4pm-6pm",
    "6pm-8pm"
  ];
  int selectedIndex = -1;
  List<Service> sampleService = [
    Service(amount: 100, service: "Washing", boxColor: Color(0xff3B4158)),
    Service(amount: 100, service: "Dry cleaning", boxColor: Color(0xff3B4158)),
    Service(amount: 200, service: "Ironing", boxColor: Color(0xff3B4158)),
    Service(amount: 130, service: "Wash and fold", boxColor: Color(0xff3B4158))
  ];

  //////////////////////////////////////////////////////////////

  int deliveryIndex = -1;
  int pickupIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.chevron_left)),
          backgroundColor: Color(0xff3B4158),
          shadowColor: Colors.transparent,
        ),
        backgroundColor: Color(0xff3B4158),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 24.0, right: 24, top: 50, bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: Text("Preparing your basket",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                    RichText(
                      text: const TextSpan(
                        text: 'Book your delivery service, ',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color(0xffD9D2D2)),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'select your convenient time and address for pick-up and drop',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, height: 1.5)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ////////////////////////////////////////////////////////////////////////
              PickupAddress(
                timeSlots: timeSlot,
              ),

              SizedBox(height: 16),
              // Center(
              //   child: ElevatedButton(
              //       style: ButtonStyle(
              //         shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //             RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         )),
              //         backgroundColor:
              //             MaterialStatePropertyAll<Color>(Color(0xff486D98)),
              //       ),
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       child: Padding(
              //           padding: EdgeInsets.only(
              //               top: 13, bottom: 13, left: 43, right: 43),
              //           child: Text("Back"))),
              // )
            ],
          ),
        )));
  }
}
