import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/models/user_model.dart';
import 'package:laundry_app/screens/home_screen/home_screen.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/widgets/bill.dart';
import 'package:laundry_app/widgets/pickup_address.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class OrderScreen3 extends StatefulWidget {
  Address? pickupAddress;
  Address? deliveryAddress;
  String? pickupTimeslot;
  String? pickupDate;
  String? deliveryDate;
  String? deliveryTimeSlot;
  OrderScreen3(
      {super.key,
      required this.deliveryAddress,
      required this.pickupAddress,
      required this.deliveryDate,
      required this.pickupDate,
      required this.deliveryTimeSlot,
      required this.pickupTimeslot});

  @override
  State<OrderScreen3> createState() => _OrderScreen3State();
}

class _OrderScreen3State extends State<OrderScreen3> {
  List<Service> selectedServices = [];
  late String bookingId;
  @override
  void initState() {
    bookingId = Uuid().v4();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderScreen1ViewModel>(builder: ((context, _, child) {
      selectedServices =
          context.watch<OrderScreen1ViewModel>().selectedServices;
      print("________________________");
      print("________________________");

      print(selectedServices);
      return Scaffold(
          backgroundColor: Color(0xff3B4158),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24, top: 90, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: Text("Laundry basket prepared",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                      RichText(
                        text: const TextSpan(
                          text: '',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xffD9D2D2)),
                          children: <TextSpan>[
                            TextSpan(
                                text:
                                    'Thank you for your laundry order! Your clothes will be clean and fresh in no time',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, height: 1.5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //////////////////

                ClipPath(
                  clipper: PointsClipper(),
                  child: Padding(
                    padding: EdgeInsets.all(35),
                    child: Container(
                        padding: EdgeInsets.all(18),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18)),
                          color: Colors.white,
                        ),
                        height: MediaQuery.of(context).size.height / 2.3,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 5, bottom: 10),
                                child: Text("Shankar",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600))),
                            const DottedLine(
                              dashColor: Color(0xff675E89),
                              dashLength: 5,
                            ),
                            Container(
                              child: Column(children: serviceText()),
                            ),

                            // serviceText("Regular wash", "No of pieces:10"),
                            // serviceText("Iron", "No of pieces:10"),
                            // serviceText("Dry clean", "No of pieces:10"),
                            text("Pick-up address",
                                widget.pickupAddress!.addressTitle),
                            text("Pick-up date and time",
                                "${widget.pickupDate}, ${widget.pickupTimeslot}"),
                            text("Delivery address",
                                widget.deliveryAddress!.addressTitle),
                            text("Pick-up date and time",
                                "${widget.deliveryDate}, ${widget.deliveryTimeSlot}"),
                            const Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Text(
                                  "Your total bill amount will be updated in the orders section after our executive collects your order",
                                  style: TextStyle(
                                      color: Color(0xffED8267),
                                      fontWeight: FontWeight.w600)),
                            )
                          ],
                        )),
                  ),
                ),
                ///////////////////////////
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, bottom: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: const [
                        Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 20,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Go back and edit",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Color(0xff486D98)),
                      ),
                      onPressed: () {
                        placeOrder();
                      },
                      child: Padding(
                          padding: EdgeInsets.only(
                              top: 13, bottom: 13, left: 43, right: 43),
                          child: Text("Place Order"))),
                ),
              ],
            ),
          ));
    }));
  }

  Widget text(leftText, rightText) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(leftText,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
          Spacer(),
          Text(rightText,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13))
        ],
      ),
    );
  }

  List<Widget> serviceText() {
    return List.generate(
        selectedServices.length,
        ((index) => Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(selectedServices[index].service,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff486D98))),
                  Spacer(),
                  Text("No of items: ${selectedServices[index].piece?.toInt()}",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 13))
                ],
              ),
            )));
  }

  Order getOrder() {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    return Order(
      phoneNumber: firebaseUser!.phoneNumber,
      id: bookingId,
      userName: firebaseUser!.uid,
      pickTimeSlot: widget.deliveryTimeSlot!,
      deliveryTimeSlot: widget.pickupTimeslot!,
      pickUpAddress: widget.pickupAddress!,
      deliveryAddress: widget.deliveryAddress!,
      selectedService: selectedServices,
    );
  }

  placeOrder() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    FirebaseFirestore firebase = FirebaseFirestore.instance;
    await firebase.collection("bookings").doc(firebaseUser!.uid).update({
      "bookings": FieldValue.arrayUnion([getOrder().toJson()])
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.grey,
        content: Text("Order placed successfully"),
      ),
    );
    Navigator.push(
        context, MaterialPageRoute(builder: ((context) => HomeScreen())));
  }
}
