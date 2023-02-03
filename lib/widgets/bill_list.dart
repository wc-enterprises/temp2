import 'package:flutter/material.dart';

import '../models/order_model.dart';
import '../screens/bill_screen/bill_screen.dart';
import 'bill_card_updated.dart';

class BillList extends StatelessWidget {
  final List<Order> orderdetails;
  bool isDeleveredVisible = true;

  BillList({
    required this.orderdetails,
    required this.isDeleveredVisible,
  });

  //Function for removing delivered items from orderdetails list

  @override
  Widget build(BuildContext context) {
    List<Order> delivered = [];

    //Functions for filtering delivered bills
    void filteringDelivered() {
      for (int i = 0; i < orderdetails.length; i++) {
        if (orderdetails[i].status == Status.delivered) {
          delivered.add(orderdetails[i]);
        }
      }
    }

    void filteringNotDelivered() {
      for (int i = 0; i < orderdetails.length; i++) {
        if (orderdetails[i].status != Status.delivered) {
          delivered.add(orderdetails[i]);
        }
      }
    }

    //function for switching from one to another tab list
    void deliveredList(bool choice) {
      if (choice) {
        filteringDelivered();
      } else {
        filteringNotDelivered();
      }
    }

    deliveredList(isDeleveredVisible);

    return SingleChildScrollView(
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BillScreen(
                        singleOrder: delivered[index],
                      ),
                    ),
                  );
                },
                child: BillCardUpdated(orderDetails: delivered[index]));
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
          itemCount: delivered.length),
    );
  }
}
