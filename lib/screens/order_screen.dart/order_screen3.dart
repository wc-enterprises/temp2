import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:laundry_app/models/address_model.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/widgets/bill.dart';

class OrderScreen3 extends StatelessWidget {
  OrderScreen3({super.key});

  @override
  Widget build(BuildContext context) {
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
    List<Order> orderdetails = [
      Order(
          id: "1234",
          pickTimeSlot: "23 Nov 2022,9am-12pm",
          deliveryTimeSlot: "25 Nov 2022,9am-12pm",
          pickUpAddress: address[0],
          deliveryAddress: address[1],
          selectedService: [
            Service(service: Services.dryCleaning, amount: 100),
            Service(service: Services.washAndIron, amount: 150)
          ],
          totalAmount: 3000,
          tax: 50)
    ];
    return Scaffold(
        backgroundColor: Color(0xff3B4158),
        body: SafeArea(
          child: BillCard(orderDetails: orderdetails[0]),
        ));
  }
}
