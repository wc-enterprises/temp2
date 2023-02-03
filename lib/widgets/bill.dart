import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/models/sub_service.dart';

class BillCard extends StatelessWidget {
  Order orderDetails;
  BillCard({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    List<Product> service = [];
    String? phone = FirebaseAuth.instance.currentUser!.phoneNumber;

    return ClipPath(
      clipper: PointsClipper(),
      child: Padding(
        padding: EdgeInsets.all(35),
        child: Container(
            padding: EdgeInsets.all(18),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18)),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 2.3,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 10, left: 5, bottom: 10),
                    child: Text("Phone number : $phone",
                        style: TextStyle(fontWeight: FontWeight.w600))),
                const DottedLine(
                  dashColor: Color(0xff675E89),
                  dashLength: 5,
                ),
                Text("Services Added",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff3B4158))),
                Container(
                  child: Column(children: serviceText()),
                ),

                // serviceText("Regular wash", "No of pieces:10"),
                // serviceText("Iron", "No of pieces:10"),
                // serviceText("Dry clean", "No of pieces:10"),
                text(
                    "Pick-up address", orderDetails.pickUpAddress.addressTitle),
                text("Pick-up date and time", orderDetails.pickTimeSlot),
                text("Delivery address",
                    orderDetails.deliveryAddress.addressTitle),
                text("Pick-up date and time", orderDetails.deliveryTimeSlot),
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
    );
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
        orderDetails.selectedService!.length,
        ((index) => Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(orderDetails.selectedService![index].name,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black)),
                ],
              ),
            )));
  }
}
