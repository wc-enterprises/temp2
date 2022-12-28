import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen.dart';
import 'package:laundry_app/screens/order_screen.dart/order_screen1.dart';

import '../models/address_model.dart';
import '../models/order_model.dart';
import '../models/service_model.dart';
import '../screens/bill_screen/bill_screen.dart';
import '../screens/view_all_screen/view_all_screen.dart';
import '../dummy_data.dart'; //Just dummy data file for passing and testing data from model

class Basket extends StatelessWidget {
  const Basket({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
   

    return Column(
      children: [

        // view all text button
        Align(alignment: Alignment.centerRight,child: TextButton(
          onPressed: (){Navigator.push(context, MaterialPageRoute(builder: ((context) => ViewAllScreen())));}, 
          child: const Text(
            "view all", 
            style: TextStyle(
              fontSize: 10, 
              fontWeight: FontWeight.w500, 
              decoration: TextDecoration.underline, 
              color: Colors.black),
            ),
          ),
        ),
        
        //Horizontal Scrollable cards
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
          
            children: const <Widget>[
              SizedBox(width: 20,),
              AddBasketCard(), //New basket adding card

              SizedBox(width: 10,),
              OrderCard() //Previous orders card list
            ],
          ),
        ),
      ],
    );
  }
}







class OrderCard extends StatelessWidget {
  const OrderCard({
    Key? key,
    
  }) : super(key: key);

 

  @override
  Widget build(BuildContext context) {

    

    return SizedBox(
      height: 140,
      child: ListView.separated(itemCount: orderdetails.length, scrollDirection: Axis.horizontal, shrinkWrap: true, 
        itemBuilder: (BuildContext context, int index){
          String status = "";
          if(orderdetails[index].status == Status.delivered){
            status = "delivered"; 
          }else if(orderdetails[index].status == Status.outForDelivery){
            status = "Out for delivery";
          }else if(orderdetails[index].status == Status.orderPlaced){
            status = "Waiting for Delivery Agent";
          }else if(orderdetails[index].status == Status.waitingForConfirmation){
            status = "Waiting for confirmation";
          }
          return Container(width: 180, decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white), 
                 padding: EdgeInsets.all(20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BillScreen(singleOrder: orderdetails[index],),));
                      }, 
                      child: Text("Review", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.black),), style: ElevatedButton.styleFrom(elevation: 0, backgroundColor: Colors.grey[200], shape: const StadiumBorder(),),),
                    const Spacer(),
                    Text(status, style: TextStyle(fontSize: 12),),
                  ],
                 ));
      }, separatorBuilder: (BuildContext context, int index) { return const SizedBox(width: 10); }, ),
    );
  }
}





class AddBasketCard extends StatelessWidget {
  const AddBasketCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        dashPattern: const [5, 5],
        color: Colors.grey,
        strokeWidth: 2,
        child: Container(
          height: 140,
          width: 130,
          padding: const EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              ElevatedButton(
                
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Theme.of(context).primaryColor, // background
                  foregroundColor: Colors.black, // foreground
                  shape: const StadiumBorder(),
                ),
                onPressed: (){},
                child: const Text("Add Basket", style: TextStyle( fontSize: 12, fontWeight: FontWeight.w600),),
        
              ),
              const Spacer(),
              const Text("Start your \nlaundry by \nadding basket", style: TextStyle(fontSize: 14),),
            ],
          ),
          
        )
      ),
    );
  }
}