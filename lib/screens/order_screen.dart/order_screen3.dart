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
              BillCard(orderDetails: orderdetails[0]),
              Padding(
                padding: const EdgeInsets.only(left: 24.0, bottom: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
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
                        child: Text("Place Order"))),
              ),
            ],
          ),
        ));
  }
}
