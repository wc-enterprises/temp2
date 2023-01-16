import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/models/service_model.dart';

class BillCardUpdated extends StatelessWidget {
  Order orderDetails;
  BillCardUpdated({super.key, required this.orderDetails});

  @override
  Widget build(BuildContext context) {
    List<Service> service = orderDetails.selectedService;
    bool billGenerated = false;
    if (orderDetails != 0) {
      billGenerated = true;
    }
    return Padding(
      padding: EdgeInsets.all(35),
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(18),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(18)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 10, left: 5, bottom: 10),
                      child: Text("Shankar",
                          style: TextStyle(fontWeight: FontWeight.w600))),
                  DottedLine(
                    dashColor: Color(0xffC2BFD0),
                    dashLength: 5,
                  ),
                  Container(
                    child: Column(children: serviceText()),
                  ),

                  // serviceText("Regular wash", "No of pieces:10"),
                  // serviceText("Iron", "No of pieces:10"),
                  // serviceText("Dry clean", "No of pieces:10"),
                  text("Pick-up address",
                      orderDetails.pickUpAddress.addressTitle),
                  text("Pick-up date and time", orderDetails.pickTimeSlot),
                  text("Delivery address",
                      orderDetails.deliveryAddress.addressTitle),
                  text("Pick-up date and time", orderDetails.deliveryTimeSlot),
                  SizedBox(
                    height: 20,
                  ),
                  DottedLine(
                    dashColor: Color(0xffC2BFD0),
                    dashLength: 5,
                  ),

                  billGenerated ? payCard() : billWaitMessage(),
                ],
              )),
          // Triangle cut effect in the bill
          ClipPath(
            clipper: PointsClipper(),
            clipBehavior: Clip.hardEdge,
            child: Container(
              height: 50,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget billWaitMessage() => Center(
      child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text("Bill will generate after pick-up",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xff11044C)))));

  Container payCard() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Bill will generate after pick-up",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xff11044C))),
          Container(
            child: Column(children: serviceText()),
          ),
          text("No of Items:", ""),
          text("Weight:", ""),
          text("Calculated Amount:", ""),
          SizedBox(
            height: 10,
          ),
          Text("Total Payable Amount:",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xff11044C))),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Center(
                  child: ElevatedButton(
                onPressed: () {},
                child: Text("Pay"),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(Color(0xffD7EF7D)),
                ),
              ))),
        ],
      ),
    );
  }

  Widget text(leftText, rightText) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Text(leftText,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff11044C))),
          Spacer(),
          Text(rightText,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                  color: Color(0xff11044C)))
        ],
      ),
    );
  }

  List<Widget> serviceText() {
    return List.generate(
        orderDetails.selectedService.length,
        ((index) => Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Text(orderDetails.selectedService[index].service,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffED8267))),
                  Spacer(),
                  Text("No of items:10",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xff11044C)))
                ],
              ),
            )));
  }
}
