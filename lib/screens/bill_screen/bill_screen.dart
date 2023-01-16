import 'package:flutter/material.dart';
import 'package:laundry_app/dummy_data.dart';
import 'package:laundry_app/models/order_model.dart';
import 'package:laundry_app/widgets/bill.dart';
import 'package:laundry_app/widgets/bill_card_updated.dart';

import '../../widgets/bill_header.dart';
import '../../widgets/bill_screen_buttons.dart';
import 'package:rive/rive.dart';

class BillScreen extends StatelessWidget {
  
  final Order singleOrder;
  BillScreen({
    required this.singleOrder,
  });

  @override
  Widget build(BuildContext context) {
    String state;
    if(singleOrder.status == Status.orderPlaced){
      state = "washing";
    }else{
      state = "Pickup";
    }
    return Scaffold(
      backgroundColor: Color(0xff212427),
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back),),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BIllHeader(),
              BillScreenButtons(),
              
              //Rive animation Area
              //Rive file is in the assets, 
              //artBoard name for onGoing process state is "washing"
              //artBoard name for pickup and delivery process state is "Pickup"
              //artBoard name should be correct**
              //artBoard washing is pingpong animation
              //artBoard Pickup is loop animation
              Center(
                child: Container(
                  height: 300,
                  width: 300,
                  
                  child: Center(child: RiveAnimation.asset("assets/Washly.riv", artboard: state,)),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 40, 40, 0),
                child: Text("Reciept", style: TextStyle(fontSize: 12, color: Colors.grey),)),
              
            
              BillCardUpdated(orderDetails: singleOrder),
              
            ],
          ),
        ),
      ),
    );
  }
}



