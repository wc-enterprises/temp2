import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/models/service_model.dart';
import 'package:laundry_app/screens/order_screen.dart/orderScreen1_viewmodel.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen2.dart';
import 'package:laundry_app/widgets/service_check_box.dart';
import 'package:provider/provider.dart';
import 'dart:async';

class OrderScreen1 extends StatefulWidget {
  OrderScreen1({super.key});

  @override
  State<OrderScreen1> createState() => _OrderScreen1State();
}

class _OrderScreen1State extends State<OrderScreen1> {
  List<Service> sampleService = [
    Service(amount: 100, service: Services.washing),
    Service(amount: 100, service: Services.dryCleaning),
    Service(amount: 200, service: Services.ironing),
    Service(amount: 130, service: Services.washAndIron)
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderScreen1ViewModel>(
      builder: ((context, _, child) {
        List<Service> selectedList =
            context.watch<OrderScreen1ViewModel>().selectedServices;
        return Scaffold(
          backgroundColor: Color(0xff3B4158),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 120, left: 30, right: 30, bottom: 30),
              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
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
                          text: 'Customize ',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xffD9D2D2)),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'select how you wish to do your laundry',
                                style: TextStyle(fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                      ServiceCheckbox(service: sampleService),
                      SizedBox(height: 23),
                      Center(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Color(0xff486D98)),
                            ),
                            onPressed: () {
                              context
                                  .read<OrderScreen1ViewModel>()
                                  .selectService(sampleService);

                              if (selectedList.length > 0) {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return ChangeNotifierProvider<
                                        OrderScreen1ViewModel>(
                                      create: ((context) {
                                        return OrderScreen1ViewModel();
                                      }),
                                      builder: ((context, child) {
                                        return SafeArea(child: OrderScreen2());
                                      }),
                                    );
                                  },
                                ));
                              } else
                                print("no service selected");
                            },
                            child: Padding(
                                padding: EdgeInsets.only(
                                    top: 13, bottom: 13, left: 43, right: 43),
                                child: Text("Next"))),
                      )
                    ]),
              ),
            ),
          ),
        );
      }),
    );
  }
}
