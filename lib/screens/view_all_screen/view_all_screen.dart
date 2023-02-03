import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:laundry_app/widgets/bill.dart';
import 'package:laundry_app/widgets/bill_card_updated.dart';

import '../../models/address_model.dart';
import '../../models/order_model.dart';
import '../../models/service_model.dart';
import '../../widgets/bill_list.dart';
import '../../widgets/view_all_page_tab_bar.dart';
import '../bill_screen/bill_screen.dart';
import '../../dummy_data.dart'; //just dummy data for passing values from model

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff3B4158),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
              ),
              child: SafeArea(
                child: Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    )),
              ),
            ),
          ),
          ViewAllTabBar(),
        ],
      ),
    );
  }
}
